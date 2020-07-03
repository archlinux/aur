# Maintainer: Carson Black <uhhadd@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgbase=eclipse
pkgname=(eclipse-{common,java,jee,cpp,php,javascript,rust})
pkgver=4.16
pkgrel=6
_release=2020-06/R
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(x86_64)
url="https://eclipse.org"
makedepends=(python3)
source=(commonify)
sha256sums=('a68cccdf182449dfb4aef595ab26fe6542902421aef42a79672483865cbbd0ea')
sha256sums_x86_64=('dc52b7486715cf13aa2642b7e96fc7d2ea1d0544c070110dd52b2644ec869e76'  # Java
                   'ae2e0f79eef3c18d80503deee52d9cb8aad9a932dfac0ff5f12d2b9fa7a05c8b'  # Jee
                   'ab98dd2b409b7ca31f97377b282d365b50ae1878639b81d618c1b795ac2cf9b9'  # C++
                   '2801ebb557ac3ab3640acef60c7423c968f6c4fd5c3683ea8ddc5119dfcdbd83'  # PHP
                   '8cee9f9577b4545ff9b6813a5bd03c07b1fd51e8c80f0b028e5a3c3ff3aed134'  # JS
                   '6dc50b31ccdf2dbdba67b0c55fd3c685f7b68a7f58c89e91fd691c1a680718fe') # Rust

_sourcename() {
  case $1 in
    eclipse-common) return 1 ;;
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

  pkgdesc+=" for $variant"
  depends=("eclipse-common=$pkgver-$pkgrel" bash)
  provides=("eclipse=$pkgver-$pkgrel")
  conflicts=(eclipse)

  install -d "$pkgdir/usr/lib"
  cp -a $1 "$pkgdir/usr/lib/eclipse"

  install -D /dev/stdin "$pkgdir/usr/bin/eclipse" <<END
#!/bin/bash
export ECLIPSE_HOME=/usr/lib/eclipse
exec \$ECLIPSE_HOME/eclipse "\$@"
END

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/eclipse.desktop" <<END
[Desktop Entry]
Name=Eclipse
Comment=$variant Development Environment
Icon=eclipse
Exec=eclipse
Terminal=false
Type=Application
Categories=Development;IDE;Java;
StartupNotify=true
END

  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm644 eclipse-common/plugins/org.eclipse.platform_*/eclipse$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/eclipse.png"
  done
}
