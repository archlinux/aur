# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander Minges <alexander.minges@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Andrzej Wąsowski <wasowski@data.pl>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>
# Contributor: Vo Van Hong Ngoc <vhngoc@ubuntu-vn.org>

pkgname=rawdog
pkgver=3.0.rc0
pkgrel=3
pkgdesc='RSS Aggregator Without Delusions Of Grandeur'
arch=('any')
url='https://github.com/echarlie/rawdog-py3'
license=('GPL2')
depends=('python' 'python-feedparser' 'python-tidylib')
makedepends=(
  'git'
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
install=rawdog.install
_commit='6ce74c30309e4353ec86e7a62fceddbd979f04f3'
source=(
  "$pkgname::git+$url#commit=$_commit"
  "$pkgname-gh-pr-1.patch::https://github.com/echarlie/rawdog-py3/pull/1.patch"
  "$pkgname-gh-pr-2.patch::https://github.com/echarlie/rawdog-py3/pull/2.patch"
  'remove-mx-module.patch'
)
sha512sums=('SKIP'
            '38f798413263617f0336dac40c9d8fb0926186e74bfcb4b19dc505c85856db24f376c355031ceca9169fdc208c5def6bbe2cb8503f2f355696e9b0df03bda4d4'
            '2072cd52491582d59e34f5fb987fe0a7741a917364de0bbd70480e96351922b3caa02ff8fa12b666a7bef0b5b23422f6ceaaa1f24d7a774fbf8c045bc81278d4'
            '82a6c2c4a8cd7e11c69e897c78b8b92d885fb95deb1c2828479cb79cc3c1f3643e58d3427e96e7ab4b1d243d7ceebf32a4a5a65743c918310e7ffc864676ed2f')
b2sums=('SKIP'
        '7be9fe8a98c2c31c7231b4c8942415c1d332b139fa6a967e9cd4fbcb308bc050bd37c092401fdeafb967c842fea00b5935bc2eb3a8f036b6c4adb372892f184e'
        'c7bfeffc29bb1bc870645681cfc7345789ad8101ddb6d2a66024592a283d4c96f7b6c582e91da9a7f34aa773771549b2ad1c2cb6d86553fce9e61b4ba3def50f'
        '92603ac0b25de2d664974b891d2ec7fc1aa888e2aeb74f58b810019e21cdf18c9b2f6b351e0e3a62e03061d30ae5543c6e595700f8c1380cc26165470d93f5f5')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//' -e 's/-/./g'
}

prepare() {
  cd "$pkgname"

  # apply fixes waiting to be upstreamed
  # https://github.com/echarlie/rawdog-py3/pull/1
  # https://github.com/echarlie/rawdog-py3/pull/2
  patch -p1 -i "$srcdir/$pkgname-gh-pr-1.patch"
  patch -p1 -i "$srcdir/$pkgname-gh-pr-2.patch"

  # the mx module doesn't exist *anywhere*, let's patch it out
  patch -p1 -i "$srcdir/remove-mx-module.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md config style.css
}
