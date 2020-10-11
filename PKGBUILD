# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=opensift-git
pkgver=r10.195d764
pkgrel=1
pkgdesc='Open-Source SIFT Library'
arch=('i686' 'x86_64')
url='https://github.com/robwhess/opensift'
license=('custom')
depends=('opencv')
makedepends=('git')
conflicts=(opensift)
provides=(opensift)

_patches=(
    0001-the-opencv4-C-API-is-broken.patch
    0002-opencv-has-fucked-up-their-headers-again.patch
    0003-opencv-broke-CV_RGB.patch
    0004-opencv-hates-developers-and-suddenly-broke-cvLoadIma.patch
    0005-opencv-has-broken-their-pkgconfig.patch
    0006-build-shared-library.patch
  )
source=('git://github.com/robwhess/opensift.git' ${_patches[@]})
md5sums=(
    'SKIP'
    '3e1c6c04a5f5f5a924a80634d6ef97b6'
    '74764a8d0db7c345e5c6ca292d2bcb3a'
    'f6bbeec038d119732806465dc5f23b04'
    '8e9a1dde8e6027a8d71e04414b743560'
    '20b51fa05d4358c6b2246230d56ebf8c'
    '927d22d3e6c5e95bafc1dfa3e2d638c2'
  )

pkgver() {
  cd opensift
  printf "r%s.%s" "$(git rev-list --count origin/HEAD)" "$(git rev-parse --short origin/HEAD)"
}
prepare() {
    cd opensift

    # Set local committer in repo for git am to work
    git config user.email "makepkg@localhost"
    git config user.name "makepkg"

    for PATCH in ${_patches[@]}; do
        git am < ../"$PATCH"
    done
}

build() {
  cd opensift
  make libopensift.so
}

package() {
  cd opensift

  install -Dm 0755 lib/libopensift.so -t "${pkgdir}/usr/lib/"
  install -Dm 0644 include/*.h -t "${pkgdir}/usr/include/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

}
