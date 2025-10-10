# Maintainer: Yang Niao <yangniao23 <at> gmail <dot> com>

pkgname=massivethreads-bin
pkgver=1.02
pkgrel=1
fedoraver=43
pkgdesc="A lightweight many-to-many threading runtime (binary from Fedora ${fedoraver})"
arch=('x86_64')
url="https://github.com/massivethreads/massivethreads"
license=('BSD')
depends=()
provides=("massivethreads=${pkgver}")
conflicts=('massivethreads')
options=(!strip)
source=(
  "https://github.com/smlsharp/repos/raw/main/fedora/rawhide/x86_64/Packages/m/massivethreads-${pkgver}-0.fc${fedoraver}.x86_64.rpm"
  "https://github.com/smlsharp/repos/raw/main/fedora/rawhide/x86_64/Packages/m/massivethreads-devel-${pkgver}-0.fc${fedoraver}.x86_64.rpm"
  "https://github.com/smlsharp/repos/raw/main/fedora/rawhide/x86_64/Packages/m/massivethreads-dr-${pkgver}-0.fc${fedoraver}.x86_64.rpm"
  "https://github.com/smlsharp/repos/raw/main/fedora/rawhide/x86_64/Packages/m/massivethreads-ld-${pkgver}-0.fc${fedoraver}.x86_64.rpm"
  "https://github.com/smlsharp/repos/raw/main/fedora/rawhide/x86_64/Packages/m/massivethreads-dl-${pkgver}-0.fc${fedoraver}.x86_64.rpm"
  "https://github.com/smlsharp/repos/raw/main/fedora/rawhide/x86_64/Packages/m/massivethreads-doc-${pkgver}-0.fc${fedoraver}.noarch.rpm"
)
noextract=()
sha256sums=(
  '7dc9e5cd03f6431f11b2182bee1ec1fdbdd2ef1ffabcb18af9283b10e42e1628' # massivethreads-${pkgver}-0.fc${fedoraver}.x86_64.rpm
  '2b6c2782b15a15c98784efe7fa432f7086ce38d211c567c8ed55b80c14871e71' # massivethreads-devel-${pkgver}-0.fc${fedoraver}.x86_64.rpm
  'b40bfeff6060c01dc511185e31bcbcb97b9f2bdf622b4efb85ae136d868fd2e1' # massivethreads-dr-${pkgver}-0.fc${fedoraver}.x86_64.rpm
  'f83fb46b16f9fc572298058b41c5d96616a38e14d37792d4a20a0993c04bbcc4' # massivethreads-ld-${pkgver}-0.fc${fedoraver}.x86_64.rpm
  '4a56a2a93709b6c5c7e175107ca54743cadd503c27ac4887346d3feac780edc6' # massivethreads-dl-${pkgver}-0.fc${fedoraver}.x86_64.rpm
  '6450e21321d8eada08ae20b26fba08ff4a6d8939ab04ce249e22ba2323c2196a'  # massivethreads-doc-${pkgver}-0.fc${fedoraver}.noarch.rpm
)

prepare() {
  mkdir -p extracted
  for f in "${source[@]##*/}"; do
    bsdtar -xf "$f" -C extracted
  done
}

package() {
  cd extracted

  # Fedoraのlib64構造をArch用に正規化
  if [ -d usr/lib64 ]; then
    mkdir -p "$pkgdir/usr/lib"
    mv usr/lib64/* "$pkgdir/usr/lib/"
  fi

  # 通常ディレクトリをコピー
  for dir in usr/bin usr/include usr/share; do
    if [ -d "$dir" ]; then
      mkdir -p "$pkgdir/$dir"
      cp -a "$dir/"* "$pkgdir/$dir/" || true
    fi
  done

  # Fedora固有の.build-idを削除
  rm -rf "$pkgdir/usr/lib/.build-id" || true

  # ライセンス
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  find usr/share/licenses -type f -exec cp {} "$pkgdir/usr/share/licenses/$pkgname/" \;

  # ドキュメント整理
  if [ -d usr/share/doc ]; then
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    cp -r usr/share/doc/* "$pkgdir/usr/share/doc/$pkgname/" || true
  fi
}

