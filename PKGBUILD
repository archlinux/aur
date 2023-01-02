# Maintainer: Matthew Gamble <git@matthewgamble.net>
# Contributor: Kyle Brennan <kyle@metalspork.xyz>

pkgname=resticprofile
pkgver=0.19.0
_commit_hash="01bbd7852d09fc05fcbda22ace207b315550c741"
pkgrel=1
pkgdesc="Configuration profiles manager and scheduler for restic backup"
arch=("x86_64")
url="https://github.com/creativeprojects/resticprofile"
license=("GPL3")
depends=("glibc" "restic")
makedepends=("go")
options=(!lto)
source=("https://github.com/creativeprojects/resticprofile/archive/v${pkgver}.tar.gz")
sha256sums=("304c370965735be61d0947d13bef18099a9cc1754bb7bd38350f690c057e808d")

build() {
    cd "resticprofile-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    LC_ALL=C _build_date="$(date)"

    go build -o resticprofile -v -ldflags "-X 'main.commit=${_commit_hash}' -X 'main.date=${_build_date}' -X 'main.builtBy=makepkg'"
}

package() {
    cd "resticprofile-${pkgver}"

    install -Dm755 resticprofile "${pkgdir}/usr/bin/resticprofile"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/resticprofile/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/resticprofile/README.md"

    install -dm755 "${pkgdir}/usr/share/resticprofile/examples/"
    install -Dm644 examples/* "${pkgdir}/usr/share/resticprofile/examples/"
    install -dm755 "${pkgdir}/usr/share/resticprofile/contrib/systemd/"
    install -Dm644 contrib/systemd/* "${pkgdir}/usr/share/resticprofile/contrib/systemd/"

    install -Dm644 contrib/completion/bash-completion.sh "${pkgdir}/usr/share/bash-completion/completions/resticprofile"
    install -Dm644 contrib/completion/zsh-completion.sh "${pkgdir}/usr/share/zsh/site-functions/_resticprofile"
}
