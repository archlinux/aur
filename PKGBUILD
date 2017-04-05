# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: Marco Crosio <marco.crosio@gmail.com>

pkgbase=eclipse-devel
pkgname=(eclipse-{common,java,cpp,jee,php}-devel)
pkgver=4.7.0.M6
pkgrel=1
_release=oxygen-M6
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
            '04e789fb695d5f95d09ddb994ae30397b39aee35f11997465dd91d129c41b2ed'
            '57559c2548ae463089acb3c2825ebc002ed83067ddc953b23d36a7b5a02deaf3')
sha512sums_i686=('ac555fc4c6f623728c768f0b644a8bf59ff7d7a2da5bf2578ec027645ddd8d8ca21f0ff7254328cc5c2418833c7af23af5ea841602ce91856f1ce867a7b08499'
                 'ef79bd85a156777b7bcf894042a69cbcd1f46a8dd7b2241519a578c3219a59d127d905632823fa0a7d85547147b31d668c40fbf4f9d967ee255f9da3a0ef951b'
                 '0cd0e98d038cc5e3a77c29ccb0e8221e5427d979e554dd8b10ab7a8db29eabb4a5d0d2dcad737194f6029b5ebb476de5759f92f53ce9126dcad967edffbd786f'
                 '9ec4bb1c9c6738ccd7ce0ff1b7b5b95649cded90b18fda8820a596bf3b29ea4bb42f164a1a51143f40b865d86f6112054d41c3d5524c13c3f9c10a8ff87edce2')
sha512sums_x86_64=('b68eab5977eb2990b491858595d5de333bf6a79a0af1ecb37d85c90346d02bead1830ea9b6ff12883e8539c54c0f628b0f3e059073dcf6e5b7636f61e82c1719'
                   '790c0a712ffc34274b65dde32f9040351a74bb39109c6d60d1de1155f783b11b1a23b0a3da698105e697aebea17cc36e25412fd68d6220ffd6d28f4d15059997'
                   '37536b9f2ccaa25e0babee170e7d93067ecbd50db474f5821f7e2d48f94a7cc1a1b30e9c850e843c9a9818527d39f91db09112945d8ed2fb088cf02fd16d2238'
                   'a0797de72eb5fcbd200a87f43cf975d45b18a423470c142d06930366da27d3179255a93be6329ebf98b372c3f8fb920b153813be92893b62183c2ba0c73b72e2')

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
  conflicts=('eclipse-common')
  install=eclipse.install

  install -d "$pkgdir/usr/lib"
  cp -a eclipse-common "$pkgdir/usr/lib/eclipse"

  install -D eclipse.sh "$pkgdir/usr/bin/eclipse"
  install -Dm644 eclipse.desktop "$pkgdir/usr/share/applications/eclipse.desktop"

  for _i in 16 32 48 256; do
    install -Dm644 eclipse-common/plugins/org.eclipse.platform_*/eclipse${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/eclipse.png"
  done
}

_package() {
  _variant=${1#eclipse-}
  pkgdesc+=" (${_variant^^} variant) Development Version"
  depends=(eclipse-common-devel=$pkgver)
  provides=("eclipse=$pkgver-$pkgrel" "eclipse-$_variant=$pkgver-$pkgrel")
  conflicts=(eclipse "eclipse-$_variant")

  case $_variant in
    java) replaces=(eclipse) ;;
    cpp)  replaces=(eclipse-cdt) ;;
  esac

  install -d "$pkgdir/usr/lib"
  cp -a $1 "$pkgdir/usr/lib/eclipse"
}
