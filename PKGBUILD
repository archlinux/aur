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
pkgrel=1
_release=2020-09/R
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(x86_64)
url="https://eclipse.org"
makedepends=(python3)
source=(commonify)
sha256sums=('a68cccdf182449dfb4aef595ab26fe6542902421aef42a79672483865cbbd0ea')
sha256sums_x86_64=('ad597ad092d349f7a2bca3ca2145614a3e9fdf3d5311b24bff1089010fd34f5e'  # Java
                   'e5b18544c492f96c378da3e01d4de1a4e03903dcbb50bb218d3aa96d93be8eb8'  # Jee
                   'fc8fff6bec74a8a6746d2c70f679188b55c7ff7c5b2134b9deecda0685fdb274'  # C++
                   '7ed9318dfdcc3ea80cf481c9f2a1fd6f98542e2f26381dcf313700eed66aa08d'  # PHP
                   'b5bddcd1bf8c602f5304e400d199e9377d6d47fd61f99cbec95e7246aa184d5c'  # JS
                   '896df756643ca2cf17803ffde785181f5660fc23148957b58d2e853b4a88f284') # Rust

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
