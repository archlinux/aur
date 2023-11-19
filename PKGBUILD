# Maintainer: Brandon Hill <brandon@mejino.family>

_appname='stable-diffusion-web-ui'
_apphome="/opt/$_appname"

_binname="$_appname-server"
_bindir="/usr/bin"

pkgname="${_appname}-git"
pkgver=v1.6.0.r2.4afaaf8a
pkgrel=1
pkgdesc="Stable Diffusion Web UI (AUTOMATIC1111)"
arch=('x86_64')
url="https://github.com/AUTOMATIC1111/stable-diffusion-webui"
license=('AGPL3')
groups=()
depends=('python' 'curl' 'grep')
makedepends=('git')
provides=("stable-diffusion-ui")
source=("${pkgname}::git+https://github.com/AUTOMATIC1111/stable-diffusion-webui.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	
    # Generate passthrough shell script to run the provided webui.sh script
    cat > $_binname <<!
#!/bin/bash
# Start Server
cd "$_apphome" && ./webui.sh
!
}

package() {
	cd "$srcdir/${pkgname}"

    # Install passthrough script
	install -Dm755 ./$_binname "$pkgdir/$_bindir/$_binname"
    
    # Copy source to app's home directory
    mkdir -p "$pkgdir/opt/"
    cp -r . "$pkgdir/$_apphome"
    chmod 777 -R "$pkgdir/$_apphome"
}
