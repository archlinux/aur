# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de

pkgname=('tika' 'tika-server')
pkgver=2.9.1
pkgrel=1
pkgdesc='Apache Tika — detect and extract metadata and text from over a thousand different file types'
arch=('any')
url='https://tika.apache.org'
license=('Apache')
depends=('java-runtime-headless')
optdepends=(
  'tesseract: OCR support'
)
makedepends=('git' 'maven')
source=(
  "https://github.com/apache/tika/archive/refs/tags/$pkgver.tar.gz"
  'tika-server.service'
  'tika.desktop'
  'tika.sh'
  'tika.svg'
)
sha256sums=('03c71a34bfcf19fc0307be575225b9556147faae5c663a6b24ed8a9cae538226'
            '4bfed9962d831fa5de01c94f83ee4784c9dd371d72035125508a63debd161862'
            '490cfc11aa05722a7831a3938a63df39b9d4d08e47e88b973479fffac17ce246'
            'caf002fe624623a6598e1753e42400e58f951d37cdf2410aaf0fd8e6343bc5c5'
            'ccae8a7ff8b30e73511e11f5c33facbf87d7e47db8cc86e14a52116ac96da9b7')

# Tests: https://issues.apache.org/jira/browse/TIKA-2487
#
# Vulnerability scanning only creates problems for the end user. There has been
# a vulnerability in a SQLite package at the time of writing this that the
# upstream does not consider serious enough to warrant a new release. They
# actually recommend disabling scanning if it breaks your builds…
build() {
  cd "$srcdir/$pkgname-$pkgver"

  mvn clean install \
    -Dmaven.test.skip=true \
    -Dmaven.repo.local=m2 \
    -Dossindex.skip
}

package_tika() {
  install -Dm755 tika.sh "$pkgdir/usr/bin/tika"
  install -Dm644 tika.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/tika.svg"
  install -Dm644 tika.desktop "$pkgdir/usr/share/applications/tika.desktop"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 "tika-app/target/tika-app-$pkgver.jar" \
    "$pkgdir/usr/lib/tika/tika-app.jar"
}

package_tika-server() {
  install -dm755 "$pkgdir/etc/default"

  cat >"$pkgdir/etc/default/tika-server" <<EOF
HOST=localhost
PORT=9998
EOF

  install -Dm644 tika-server.service \
    "$pkgdir/usr/lib/systemd/system/tika-server.service"

  cd "$srcdir/tika-$pkgver"

  install -Dm644 "tika-server/tika-server-standard/target/tika-server-standard-$pkgver.jar" \
    "$pkgdir/usr/lib/tika-server/tika-server.jar"
}
