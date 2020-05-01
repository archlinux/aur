# Maintainer:  Carson Black <uhhadd@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgbase=eclipse
pkgname=(eclipse-{common,java,jee,cpp,php,javascript,rust})
pkgver=4.14
pkgrel=2
_release=2019-12/R
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(x86_64)
url="https://eclipse.org"
makedepends=(python3)
source=(commonify)
sha256sums=('a68cccdf182449dfb4aef595ab26fe6542902421aef42a79672483865cbbd0ea')
sha256sums_x86_64=('eea78b2daab7c5d3e11cd86d0782023a05f7e173265f470536357ef97cd31a29'
                   'a012ad5dd54c344aff66b82f0ed37b54002e727566c7d786d0d60f96b1117c38'
                   '56c3f4757d31ac002f996de0e81edb18cdf660d6193aa0b076e25dae32079789'
                   '427b1d74485ccde8b3c6d2b23390be74123281e90ad8e93db701d9835130039a'
                   '2a17772438a1966f182e2aa2433e1119c9988b2d50f54dc89f476fcca8fe2755'
                   '88ff37f326648a8bfc061ec9e14823a776e182b715ca5d7dc06b6942c903460c')

_sourcename() {
  case $1 in
    eclipse-common) return 1 ;;
    eclipse-rust  ) echo $1-${_release//\//-}-incubation-linux-gtk-x86_64.tar.gz ;;
    *             ) echo $1-${_release//\//-}-linux-gtk-x86_64.tar.gz ;;
  esac
}

source_x86_64=()
noextract=()

for _pkg in ${pkgname[@]}; do
  _src=$(_sourcename $_pkg) || continue
  source_x86_64+=(http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/$_release/$_src)
  noextract+=($_src)
  eval "package_$_pkg() { _package $_pkg; }"
done


prepare() {
  local pkg src
  for pkg in ${pkgname[@]}; do
    mkdir $pkg
    src=$(_sourcename $pkg) || continue
    bsdtar -xf $src -C $pkg --strip-components 1
  done
}

build() {
  mkdir eclipse-common/dropins
  touch eclipse-common/dropins/.keep
  ./commonify --identical ${pkgname[@]}
}

package_eclipse-common() {
  pkgdesc+=" (common files)"
  depends=("java-environment>=8" webkit2gtk unzip)

  install -d "$pkgdir/usr/lib"
  cp -a eclipse-common "$pkgdir/usr/lib/eclipse"
}

_package() {
  local variant i

  case ${1#eclipse-} in
    java      ) variant=Java; replaces=(eclipse) ;;
    jee       ) variant=JEE ;;
    cpp       ) variant=C++; replaces=(eclipse-cdt) ;;
    php       ) variant=PHP ;;
    javascript) variant=JavaScript ;;
    rust      ) variant=Rust ;;
    *         ) return 1 ;;
  esac

  _lower=${variant,,}

  pkgdesc+=" for $variant"
  depends=("eclipse-common=$pkgver-$pkgrel" bash fuse-overlayfs)

  install -d "$pkgdir/usr/lib"
  cp -a $1 "$pkgdir/usr/lib/eclipse-${_lower}"

  install -D /dev/stdin "$pkgdir/usr/lib/eclipse-${_lower}-helper" <<END
#!/bin/bash
mkdir -p /tmp/eclipse-${_lower}-workdir
mkdir -p /tmp/eclipse-${_lower}-upper
mkdir -p /run/user/\$1/eclipse-${_lower}
fuse-overlayfs -o lowerdir=/usr/lib/eclipse:/usr/lib/eclipse-${_lower},upperdir=/tmp/eclipse-${_lower}-upper,workdir=/tmp/eclipse-${_lower}-workdir /run/user/\$1/eclipse-${_lower}
export ECLIPSE_HOME=/run/user/\$1/eclipse-${_lower}
unshare -U /run/user/\$1/eclipse-${_lower}/eclipse "\${@:1}" -configuration \$HOME/.eclipse-${_lower}-config -data \$HOME/eclipse-${_lower}-workspace
END

  install -D /dev/stdin "$pkgdir/usr/bin/eclipse-${_lower}" <<END
#!/bin/bash
exec unshare -rm /usr/lib/eclipse-${_lower}-helper \$(id -u) "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/eclipse-${_lower}.desktop" <<END
[Desktop Entry]
Name=Eclipse $variant
Comment=$variant Development Environment
Icon=eclipse-${_lower}
Exec=eclipse-${_lower}
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END

  sed -i "1 i -configuration=@user.home/.eclipse-${_lower}" "$pkgdir/usr/lib/eclipse-${_lower}/eclipse.ini"
  sed -i "s%-Dosgi.instance.area.default=@user.home/eclipse-workspace%-Dosgi.instance.area.default=@user.home/eclipse-${_lower}-workspace%g" "$pkgdir/usr/lib/eclipse-${_lower}/eclipse.ini"

  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm644 eclipse-common/plugins/org.eclipse.platform_*/eclipse$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/eclipse-${_lower}.png"
  done
}
