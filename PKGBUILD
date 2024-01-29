# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
pkgname=chasquid
pkgver=1.11.1
pkgrel=1
pkgdesc='SMTP (email) server with a focus on simplicity, security, and ease of operation'
arch=('x86_64')
url="https://blitiri.com.ar/p/chasquid"
license=('Apache')
makedepends=('git' 'go')
checkdepends=('msmtp' 'python')
optdepends=(
    'dkim-git: DKIM signing (post-data hook)'
    'clamav: Virus scanning (post-data hook)'
    'rspamd: Spam filtering (post-data hook)'
    'spamassassin: Spam filtering (post-data hook)'
    'greylistd: Greylisting (post-data hook)'
)
conflicts=('chasquid-git')
backup=('etc/chasquid/chasquid.conf')
source=(
    "${pkgname}-git::git+https://github.com/albertito/chasquid.git#tag=v${pkgver}"
    'chasquid.tmpfiles'
)
# XXX: Upstream provides no way to do source authenticatiion besides using HTTPS.
b2sums=(
    'SKIP'
    '863f656782c152cb345a949b33c33d5cfb3778ff2b2be9a8c07f4c2d12330beacba7725b37d7e31ad1d8092f3c432f9339c25100082699e51e8a99f00fc451b5'
)

build() {
    cd "${srcdir}/${pkgname}-git"

    go build -trimpath -ldflags="\
        -X main.version=${pkgver} \
        -X main.sourceDateTs=${SOURCE_DATE_EPOCH} \
        -extldflags ${LDFLAGS} \
        " ${GOFLAGS} .
    go build -trimpath -ldflags="-extldflags ${LDFLAGS}" ${GOFLAGS} ./cmd/chasquid-util
    go build -trimpath -ldflags="-extldflags ${LDFLAGS}" ${GOFLAGS} ./cmd/smtp-check
    go build -trimpath -ldflags="-extldflags ${LDFLAGS}" ${GOFLAGS} ./cmd/mda-lmtp
}

check() {
    cd "${srcdir}/${pkgname}-git"

    go test ${GOFLAGS} ./...

    # run.sh replaces binary in the repo root so back it up.
    mv chasquid chasquid.bkp

    setsid -w ./test/run.sh
    setsid -w ./test/stress.sh
    setsid -w ./cmd/chasquid-util/test.sh
    setsid -w ./cmd/mda-lmtp/test.sh
    setsid -w ./cmd/dovecot-auth-cli/test.sh

    mv chasquid.bkp chasquid
}

package() {
    cd "${srcdir}/${pkgname}-git"

    install -Dm 0644 ../chasquid.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/chasquid.conf"

    install -Dm 0644 -t "${pkgdir}/usr/share/man/man1/" docs/man/*.1
    install -Dm 0644 -t "${pkgdir}/usr/share/man/man5/" docs/man/*.5
    install -Dm 0644 -t "${pkgdir}/usr/share/doc/chasquid" docs/*.md

    install -Dm 0644 etc/chasquid/chasquid.conf "${pkgdir}/etc/chasquid/chasquid.conf"
    install -Dm 0644 etc/chasquid/hooks/post-data "${pkgdir}/etc/chasquid/hooks/post-data"
    install -Dm 0644 etc/chasquid/README "${pkgdir}/etc/chasquid/README"

    install -Dm 0644 -t "${pkgdir}/usr/lib/systemd/system/" "${srcdir}/${pkgname}-git/etc/systemd/system"/*

    install -Dm 0755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}-git/"{chasquid,chasquid-util,smtp-check,mda-lmtp}
}
