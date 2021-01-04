# Maintainer: Carson Black <uhhadd@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

# Toggle this if you're building outside of the AUR, for a repo.
AUR_BUILD=true

pkgbase=eclipse
pkgname=(eclipse-{java,jee,cpp,php,javascript,rust})
if [ "$AUR_BUILD" = false ]; then
pkgname+=(eclipse-common)
fi
pkgver=4.18
pkgrel=1
epoch=2
_release=2020-12/R
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(x86_64)
url="https://eclipse.org"
makedepends=(python3)
source=(commonify)
sha256sums=('a68cccdf182449dfb4aef595ab26fe6542902421aef42a79672483865cbbd0ea')
sha256sums_x86_64=('2193208753cae8505b4926386dc7bb71cb665929180bf8c1a63dda0251dbaaf1'  # Java
                   '7349e3051925c6ec88f03036f40b3f493e62e252d050e86493a9ceea5d1ab1b2'  # Jee
                   'b5678a117da21912178d4188b8b6976b578dc03a38669eb4c8e16dd71c74747a'  # C++
                   'a681e8e65835f75ad8b9a7da8e11ded90ea4d8bda82b8133a8debd1852ec37b9'  # PHP
                   'a681e8e65835f75ad8b9a7da8e11ded90ea4d8bda82b8133a8debd1852ec37b9'  # JS
                   'a681e8e65835f75ad8b9a7da8e11ded90ea4d8bda82b8133a8debd1852ec37b9') # Rust

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
  if [ "$AUR_BUILD" = false ]; then
  mkdir eclipse-common/dropins
  touch eclipse-common/dropins/.keep
  ./commonify --identical ${pkgname[@]}
  fi
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
  depends=("java-environment>=8" webkit2gtk unzip)
  if [ "$AUR_BUILD" = false ]; then
  depends=("eclipse-common=$pkgver-$pkgrel" bash)
  fi
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

  if [ "$AUR_BUILD" = false ]; then
  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm644 eclipse-common/plugins/org.eclipse.platform_*/eclipse$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/eclipse.png"
  done
  else
  for i in 16 22 24 32 48 64 128 256 512 1024; do
    install -Dm644 $1/plugins/org.eclipse.platform_*/eclipse$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/eclipse.png"
  done
  fi
}
