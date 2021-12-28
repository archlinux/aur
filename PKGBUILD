# Maintainer: Jens Jäschke <arch [at] jensjaeschke [dot] de>

pkgname=kopia
pkgdesc='A cross-platform backup-tool with encryption, deduplication, compression and cloud support.'
pkgver=0.9.8
pkgrel=1
arch=('x86_64')
url='https://kopia.io'
license=('APACHE')
depends=('glibc')
makedepends=('go>=1.17')
#makedepends=('go>=1.15', 'git') # git is needed if we switch to signed git commits/tags in the future
#source=("$pkgname-$pkgver::git+https://github.com/kopia/kopia.git#commit=$(git rev-list -n 1 v$pkgver)?signed") # use git commit, if those are signed by a proper key in the future
#source=("$pkgname-$pkgver::git+https://github.com/kopia/kopia.git#tag=v$pkgver?signed") # use git tag, if those are signed by a proper key in the future
source=("$pkgname-$pkgver.tar.gz::https://github.com/kopia/kopia/archive/refs/tags/v$pkgver.tar.gz") # use unsigned tarball for now.
sha256sums=('855a785778442322c4ef5de7ba666879906dac7e3d6d04746f97bb4694f6c82b')
#checksums calculated by packager, no checksums available from upstream for source tarball.

build() {
        cd $srcdir/$pkgname-$pkgver
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
        echo "$CGO_CFLAGS \n $CGO_CPPFLAGS \n $CGO_CXXFLAGS \n $CGO_LDFLAGS"
        #make html-ui
        #go build -tags embedhtml
        go build -ldflags "-X github.com/kopia/kopia/repo.BuildVersion=$pkgver-$pkgrel -X github.com/kopia/kopia/repo.BuildInfo=unofficial -X github.com/kopia/kopia/repo.BuildGitHubRepo=ARCH_USER_REPOSITORY"
}

package() {
    mkdir -p "$pkgdir/usr/bin/"
    cp "$srcdir/$pkgname-$pkgver/kopia" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/kopia"
}
