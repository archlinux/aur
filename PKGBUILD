# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Carson Black <uhhadd@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgbase=eclipse
pkgname=(eclipse-{common,java,jee,cpp,php,javascript,rust})
pkgver=4.15
pkgrel=2
_release=2020-03/R
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(x86_64)
url="https://eclipse.org"
makedepends=(python3)
source=(commonify)
sha256sums=('a68cccdf182449dfb4aef595ab26fe6542902421aef42a79672483865cbbd0ea')
sha256sums_x86_64=('72fde94154999df569cbd30551bc784341391b9753209cd563829a6c8674383e'
                   '1f6b44cc8a8665f452170f395523486e3555570174768d96d8ca7e2bacc3f31d'
                   '3cc546c7bd9214ca834cf5d8bcd16e300ae0fa95f1bf49e15c52ea47235b7f01'
                   '0d6662d7a57585320f441029358261c23e570bf7779cbe34ee2f91208b2aff54'
                   '25a2e502e33c0a4b6629b35dfb140d5bd772d932ca472e554f672524d189caec'
                   'c52860b6134e083aa263d1c1eb80f4a904cdf284d25f7aaee472950386347109')

_sourcename() {
  case $1 in
    eclipse-common) return 1 ;;
    eclipse-rust | eclipse-jee | eclipse-cpp | eclipse-javascript) echo $1-${_release//\//-}-incubation-linux-gtk-x86_64.tar.gz ;;
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
  depends=("eclipse-common=$pkgver-$pkgrel" bash)
  provides=("eclipse=$pkgver-$pkgrel")

  install -d "$pkgdir/usr/lib"
  cp -a $1 "$pkgdir/usr/lib/eclipse-${_lower}"

  install -D /dev/stdin "$pkgdir/usr/bin/eclipse-${_lower}" <<END
#!/bin/bash
export ECLIPSE_HOME=/usr/lib/eclipse-"${_lower}"
exec /usr/lib/eclipse/eclipse "\$@"
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

  sed -i "$ a -classpath \"/usr/lib/eclipse:/usr/lib/eclipse-${_lower}:.\"" "$pkgdir/usr/lib/eclipse-${_lower}/eclipse.ini"
  sed -i "s%-Dosgi.instance.area.default=@user.home/eclipse-workspace%-Dosgi.instance.area.default=@user.home/eclipse-${_lower}-workspace%g" "$pkgdir/usr/lib/eclipse-${_lower}/eclipse.ini"

  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm644 eclipse-common/plugins/org.eclipse.platform_*/eclipse$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/eclipse-${_lower}.png"
  done
}
