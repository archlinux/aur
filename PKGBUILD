# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>
# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

# Co-Maintainer: Aniket Pradhan <aniket17133@iiitd.ac.in>

# Owner/Cofntributer: Xinzhao Xu <z2d@jifangcheng.com>

pkgname=annie-git
pkgver=0.9.3
pkgrel=1
arch=('x86_64')
pkgdesc="A fast, simple and clean video downloader written in Go"
url="https://github.com/iawia002/annie"
license=("MIT")
makedepends=('dep')
depends=('go-pie' 'ffmpeg')
conflicts=("annie")
options=('!strip' '!emptydirs')
source=("${pkgname}::git+https://github.com/iawia002/annie#branch=master")
sha256sums=('SKIP')

prepare(){
	mkdir -p gopath/src/github.com
	ln -rTsf $pkgname $srcdir/gopath/src/github.com/$pkgname
	export GOPATH="$srcdir"/gopath
	cd $GOPATH/src/github.com/$pkgname
	#dep init
	dep ensure
}

build(){
	export GOPATH=$srcdir/gopath
	cd gopath/src/github.com/$pkgname
	go install \
		-gcflags "all=-trimpath=$GOPATH" \
		-asmflags "all=-trimpath=$GOPATH" \
		-ldflags "-extldflags $LDFLAGS" \
		-v ./...
}

package() {
	install -Dm755 gopath/bin/annie-git "$pkgdir"/usr/bin/annie
	cd "${srcdir}/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
