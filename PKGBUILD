# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: malacology <guoyizhang at malacology dot net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gotosocial-rc
_pkgname=${pkgname%-rc}
pkgver=0.14.2
pkgrel=1
pkgdesc='ActivityPub social network server written in Golang (release candidate)'
arch=('x86_64')
url='https://gotosocial.org'
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go' 'yarn' 'nodejs' 'go-swagger')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
options=('!lto')
backup=(
  'etc/gotosocial/config.yaml'
  'etc/gotosocial/template/404.tmpl'
  'etc/gotosocial/template/about.tmpl'
  'etc/gotosocial/template/authorize.tmpl'
  'etc/gotosocial/template/confirmed.tmpl'
  'etc/gotosocial/template/domain-blocklist.tmpl'
  'etc/gotosocial/template/email_confirm.tmpl'
  'etc/gotosocial/template/email_new_report.tmpl'
  'etc/gotosocial/template/email_report_closed.tmpl'
  'etc/gotosocial/template/email_reset.tmpl'
  'etc/gotosocial/template/email_test.tmpl'
  'etc/gotosocial/template/error.tmpl'
  'etc/gotosocial/template/finalize.tmpl'
  'etc/gotosocial/template/settings.tmpl'
  'etc/gotosocial/template/index.tmpl'
  'etc/gotosocial/template/index_apps.tmpl'
  'etc/gotosocial/template/oob.tmpl'
  'etc/gotosocial/template/page.tmpl'
  'etc/gotosocial/template/page_footer.tmpl'
  'etc/gotosocial/template/page_header.tmpl'
  'etc/gotosocial/template/page_ogmeta.tmpl'
  'etc/gotosocial/template/page_stylesheets.tmpl'
  'etc/gotosocial/template/profile.tmpl'
  'etc/gotosocial/template/profile_fields.tmpl'
  'etc/gotosocial/template/sign-in.tmpl'
  'etc/gotosocial/template/status.tmpl'
  'etc/gotosocial/template/status_attachments.tmpl'
  'etc/gotosocial/template/status_attributes.tmpl'
  'etc/gotosocial/template/status_header.tmpl'
  'etc/gotosocial/template/status_info.tmpl'
  'etc/gotosocial/template/status_poll.tmpl'
  'etc/gotosocial/template/tag.tmpl'
  'etc/gotosocial/template/thread.tmpl'
)
_commit='0bd95d7b71ae71d801b0fbb643598eb0ccd1b8f5'
source=(
  "$_pkgname::git+https://github.com/superseriousbusiness/gotosocial#commit=$_commit"
  'sysusers.conf'
  'tmpfiles.conf'
  'use-fhs-directories.patch'
)
sha512sums=('SKIP'
            '68890539a1285a819d5a2cd755aeabd59a9872926d9c32e5d54faaf2771414f006e568f2f813f3c6fcd9dbeda7b6e57c924d7490521880cb65632e02fabcbd63'
            'b89fad3073e140f17167515b38942e5b5e2bc2aee03c484e1bb7cf6444f86cb1e2a13a60b101e04d22633d348be073ca26cd309da4746e5062c12b4f3ce4b38a'
            '913a5209487aba06bf1d8ac7c02506a05d01a8e12f172666c84bf6870d6237640d4745617b0f07ea8c9dcf665f4e0d24a0aabef31611909f7e9384ed6e7b7e77')
b2sums=('SKIP'
        '0a5be7ac18af882c0c89d8e930eb76c2e60bc2c1d5a375ab04e987c7de9a7a3175319c4e5fbc818261141daf5f70d583aebcc2dc197fe3a88047fbfe488ccb94'
        '4f65af952441c0f54bb32049a149675e207f8993678423d369c4095c57476464614ac720eccc64d7a93a81268ad7ca41cae75ca7211bd7b78f9035f6e5341f04'
        '9edd4520fb99856feb82d01935588add7f805aa180f2ed0fe169cb26576bc2e1d2c1e6ab11604d977cec6a4ad8f1d5be1413e1a366de59b89c5b869136538f8c')

pkgver() {
  cd "$_pkgname"

  git describe --tags | sed 's/^v//' | sed 's/-//g'
}

prepare() {
  cd "$_pkgname"

  # create directory for build output
  mkdir -p build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download

  # use FHS directories
  patch -p1 -i "$srcdir/use-fhs-directories.patch"
}

build() {
  cd "$_pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  # generate up-to-date swagger.yaml
  swagger generate spec --scan-models --exclude-deps -o web/assets/swagger.yaml
  sed -e "s/REPLACE_ME/$pkgver/" -i web/assets/swagger.yaml

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags ${LDFLAGS} \
    -X main.Version=$pkgver" \
    -o build \
    ./cmd/...

  # generate web assets
  yarn --cwd ./web/source install --frozen-lockfile
  yarn --cwd ./web/source ts-patch install
  yarn --cwd ./web/source build
}

package() {
  # systemd integration
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -vDm644 "$_pkgname/example/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  cd "$_pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$_pkgname"

  # configuration
  install -vDm640 -t "$pkgdir/etc/$_pkgname" example/config.yaml

  # web frontend
  install -vd "$pkgdir/usr/share/$_pkgname"
  cp -vr web/assets/* "$pkgdir/usr/share/$_pkgname"
  cp -vr web/template "$pkgdir/etc/$_pkgname"
}
