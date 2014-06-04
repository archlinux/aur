# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf-hg
pkgver=1.3.r6.bf7ee7fbc2b0
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL (development version)'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL' 'custom: ID')
provides=('ecwolf')
conflicts=('ecwolf')
depends=('sdl_mixer' 'libjpeg' 'gtk2')
makedepends=('mercurial' 'cmake')
optdepends=('wolf3d-shareware: Demo version of Wolfenstein 3D')
install=ecwolf.install
source=("hg+https://bitbucket.org/Blzut3/ecwolf"
        "ecwolf-datadirs.patch")
sha256sums=('SKIP'
            'f99391f9139fc796dc69b081132ca76ce2ecb16978b29a1e864969946c15283c')

pkgver() {
  cd ecwolf
  _tag=$(hg tags -q | sort -r | grep "^[0-9]\.[0-9]" | head -n1)
  _commits=$(hg log --template "{node}\n" -r $_tag:tip | wc -l)
  printf "%s.r%s.%s" "$_tag" "$_commits" "$(hg identify -i)"
}

prepare() {
  # reset build folder
  rm -rf build
  mkdir build

  # data dir hack (using a patch, so we can see it fail, when the source has changed)
  patch -Np0 <ecwolf-datadirs.patch
}

build() {
  cd build

  # build patch utility and enable gpl licensed opl emulator
  cmake ../ecwolf -DBUILD_PATCHUTIL=ON -DGPL=ON
  make
}

package() {
  cd build

  # binaries
  install -Dm755 ecwolf "$pkgdir"/usr/bin/ecwolf
  install -m755 tools/patchutil/patchutil "$pkgdir"/usr/bin/ecwolf-patchutil
  # data
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
  cd ../ecwolf
  # doc
  install -d "$pkgdir"/usr/share/doc/ecwolf-hg
  install -Dm644 README.* "$pkgdir"/usr/share/doc/ecwolf-hg
  # license
  install -Dm644 docs/license-id.txt "$pkgdir"/usr/share/licenses/ecwolf-hg/license-id.txt
}
