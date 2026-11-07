# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>

pkgname=bbdown
pkgver=1.7.8
pkgrel=1
pkgdesc='一款命令行式哔哩哔哩下载器'
arch=('x86_64')
url='https://github.com/aliveranme/BBDown'
license=('MIT')
depends=('ffmpeg' 'bento4')
install="$pkgname.install"
makedepends=('dotnet-sdk' 'clang' 'aspnet-targeting-pack')
optdepends=('aria2: 多线程分段下载')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'bbdown-xdg.patch'
        'bbdown.sh')
sha256sums=('9264e2468cc379ba369b5096107ef232f1f1234d2649668a1606072d3a17304c'
            '7fd078e65a4ea7832036a960fe187ea7204cd4417364dbe081f168c7b0bd27e8'
            '05882947ede7e705bc5770694bce651cabbe05dd363378c5ea3542393056ee82')

prepare() {
  cd "BBDown-$pkgver"
  rm -f global.json
  patch -Np1 -i "$srcdir/bbdown-xdg.patch"
}

build() {
  cd "BBDown-$pkgver"
  dotnet publish BBDown/BBDown.csproj \
    -c Release -r linux-x64 --self-contained -o publish
}

package() {
  cd "BBDown-$pkgver"
  install -Dm755 publish/BBDown "$pkgdir/usr/lib/BBDown/BBDown"
  install -Dm644 publish/device.wvd "$pkgdir/usr/lib/BBDown/device.wvd"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "$srcdir/bbdown.sh" "$pkgdir/usr/bin/BBDown"
  ln -s BBDown "$pkgdir/usr/bin/bbdown"
}

