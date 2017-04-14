# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgbase=eclipse-devel
pkgname=(eclipse-{common,java,cpp,jee,php}-devel)
_milestone=M6
pkgver=4.7.0.${_milestone}
pkgrel=2
_release=oxygen-${_milestone}
pkgdesc="Highly extensible IDE"
license=(EPL)
arch=(i686 x86_64)
url="https://eclipse.org"
makedepends=(ruby)
options=(!emptydirs)
source=(commonify eclipse.sh eclipse.desktop)
source_i686=()
source_x86_64=()
noextract=()

for _pkg in ${pkgname[@]/-devel/}; do
  [[ $_pkg == 'eclipse-common' ]] && continue
  source_i686+=(http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/${_release/-//}/$_pkg-$_release-linux-gtk.tar.gz)
  source_x86_64+=(http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/technology/epp/downloads/release/${_release/-//}/$_pkg-$_release-linux-gtk-x86_64.tar.gz)
  noextract+=($_pkg-$_release-linux-gtk{,-x86_64}.tar.gz)
  eval "package_${_pkg}-devel() { _package $_pkg; }"
done

sha256sums=('9f8980078c97fb3020ba2e9c6c07eac077b932406aba3e2d6a4763a5d299290d'
            '7f0c352f8593774838d96c213293de6d00fb6d71becce8d4ff6209bb8c58e8f6'
            'be491b305ee6d5fd4a94db4d2b31a5fbc69539e3f97094ffc35246e104deea17')
sha1sums_i686=()
sha1sums_x86_64=()

for _file in "${source_i686[@]}" ; do
	sha1sums_i686+=( $( curl -s "${_file}".sha1 | cut -f1 -d' ' ) )
done

for _file in "${source_x86_64[@]}" ; do
	sha1sums_x86_64+=( $( curl -s "${_file}".sha1 | cut -f1 -d' ' ) )
done

prepare() {
  mkdir eclipse-common

  for _pkg in ${pkgname[@]/-devel/}; do
    [[ $_pkg == 'eclipse-common' ]] && continue

    if [[ $CARCH == x86_64 ]]; then
      bsdtar -xf "$_pkg-$_release-linux-gtk-x86_64.tar.gz"
    else
      bsdtar -xf "$_pkg-$_release-linux-gtk.tar.gz"
    fi

    mv eclipse $_pkg
  done
}

build() {
  ./commonify ${pkgname[@]/-devel/}

  mkdir -p eclipse-common/dropins
  touch eclipse-common/dropins/.keep
}

package_eclipse-common-devel() {
  pkgdesc+=" (common files) Development Version"
  depends=("java-environment>=8" webkit2gtk unzip)
  provides=("eclipse-common=$pkgver-$pkgrel")
  install=eclipse.install

  install -d "$pkgdir/opt"
  cp -a eclipse-common "$pkgdir/opt/eclipse-devel"

  install -Dm755 eclipse.sh "$pkgdir/usr/bin/eclipse-devel"
  install -Dm644 eclipse.desktop "$pkgdir/usr/share/applications/eclipse-devel.desktop"

  for _i in 16 32 48 256; do
    install -Dm644 eclipse-common/plugins/org.eclipse.platform_*/eclipse${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse-devel.png"
  done
}

_package() {
  _variant=${1#eclipse-}
  pkgdesc+=" (${_variant^^} variant) Development Version"
  depends=(eclipse-common-devel=$pkgver)
  provides=("eclipse-$_variant=$pkgver-$pkgrel")

  install -d "$pkgdir/opt"
  cp -a $1 "$pkgdir/opt/eclipse-devel"
}
