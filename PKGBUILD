# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: malacology <guoyizhang at malacology dot net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gotosocial
pkgver=0.5.0
pkgrel=1
pkgdesc='ActivityPub social network server written in Golang'
arch=('x86_64')
url='https://gotosocial.org'
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go' 'yarn' 'nodejs' 'go-swagger')
options=('!lto')
backup=(
  'usr/lib/systemd/system/gotosocial.service'
  'etc/gotosocial/config.yaml'
  'etc/gotosocial/template/404.tmpl'
  'etc/gotosocial/template/authorize.tmpl'
  'etc/gotosocial/template/confirmed.tmpl'
  'etc/gotosocial/template/email_confirm_html.tmpl'
  'etc/gotosocial/template/email_confirm_text.tmpl'
  'etc/gotosocial/template/email_reset_html.tmpl'
  'etc/gotosocial/template/email_reset_text.tmpl'
  'etc/gotosocial/template/error.tmpl'
  'etc/gotosocial/template/footer.tmpl'
  'etc/gotosocial/template/frontend.tmpl'
  'etc/gotosocial/template/header.tmpl'
  'etc/gotosocial/template/index.tmpl'
  'etc/gotosocial/template/profile.tmpl'
  'etc/gotosocial/template/sign-in.tmpl'
  'etc/gotosocial/template/status.tmpl'
  'etc/gotosocial/template/thread.tmpl'
)
_commit='00d38855d416e834c2657271823e0ee95397d7ba'
source=(
  "$pkgname::git+https://github.com/superseriousbusiness/gotosocial#commit=$_commit"
  'sysusers.conf'
  'tmpfiles.conf'
)
sha512sums=('SKIP'
            '68890539a1285a819d5a2cd755aeabd59a9872926d9c32e5d54faaf2771414f006e568f2f813f3c6fcd9dbeda7b6e57c924d7490521880cb65632e02fabcbd63'
            'b89fad3073e140f17167515b38942e5b5e2bc2aee03c484e1bb7cf6444f86cb1e2a13a60b101e04d22633d348be073ca26cd309da4746e5062c12b4f3ce4b38a')
b2sums=('SKIP'
        '0a5be7ac18af882c0c89d8e930eb76c2e60bc2c1d5a375ab04e987c7de9a7a3175319c4e5fbc818261141daf5f70d583aebcc2dc197fe3a88047fbfe488ccb94'
        '4f65af952441c0f54bb32049a149675e207f8993678423d369c4095c57476464614ac720eccc64d7a93a81268ad7ca41cae75ca7211bd7b78f9035f6e5341f04')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download

  # modify systemd file
  sed \
    -e 's@\(ExecStart=\)/gotosocial/gotosocial@\1/usr/bin/gotosocial@' \
    -e 's@config.yaml@/etc/gotosocial/config.yaml@' \
    -e 's@\(WorkingDirectory=\).*$@\1/var/lib/gotosocial@' \
    -i example/gotosocial.service

  # modify default configuration
  sed \
    -e 's@^\(web-template-base-dir: "\).*$@\1/etc/gotosocial/template"@' \
    -e 's@^\(web-asset-base-dir: "\).*$@\1/usr/share/gotosocial"@' \
    -e 's@^\(letsencrypt-cert-dir: "\).*$@\1/var/lib/gotosocial/storage/certs"@' \
    -e 's@^\(storage-local-base-path: "\).*$@\1/var/lib/gotosocial/storage"@' \
    -e 's@^\(db-type: "\).*$@\1sqlite"@' \
    -e 's@^\(db-address: "\).*$@\1/var/lib/gotosocial/sqlite.db"@' \
    -i example/config.yaml
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # generate up-to-date swagger.yml
  swagger generate spec -o web/assets/swagger.yaml --scan-models

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=$pkgver" \
    -o build \
    ./cmd/...

  # generate web assets
  yarn install --cwd web/source
  BUDO_BUILD=1 node web/source
}

package() {
  # systemd integration
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 "$pkgname/example/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # configuration
  install -vDm640 -t "$pkgdir/etc/$pkgname" example/config.yaml

  # web frontend
  install -vd "$pkgdir/usr/share/$pkgname"
  cp -vr web/assets/* "$pkgdir/usr/share/$pkgname"
  cp -vr web/template "$pkgdir/etc/$pkgname"
}
