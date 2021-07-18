_pkgname=wg-manager
pkgname="${_pkgname}-git"
pkgver=r216.e70ba4b
pkgrel=1
pkgdesc="A easy to use WireGuard dashboard and management tool"
arch=("any")
url="https://github.com/perara/wg-manager"
license=("MIT")
depends=(
    "wireguard-tools" "uvicorn" "nodejs" "npm"
    "python" "python-pydantic" "python-fastapi" "python-aiofiles" "python-aiosqlite" "python-sqlalchemy" "python-databases" "python-pyjwt" "python-passlib" "python-bcrypt" "python-python-multipart" "python-jinja" "python-sqlalchemy-utils" "python-sqlalchemy-migrate" "python-requests" "python-uvloop" "python-httptools"
    "python-uvicorn-loguru-integration"
)
makedepends=("angular-cli")
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git" "wg-manager.service")
md5sums=('SKIP'
         '1aeba283c71d79defdd4075dfdc3772f')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}/wg-manager-frontend"
    npm install --legacy-peer-deps # won't build without --legacy-peer-deps
    ng build --configuration="production"
}

package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/opt/"
    mv wg-manager-backend "${pkgdir}/opt/wg-manager"
    mv wg-manager-frontend/dist "${pkgdir}/opt/wg-manager/build"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/"
    mv "${srcdir}/wg-manager.service" "${pkgdir}/usr/lib/systemd/system/"
}
