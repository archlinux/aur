# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=linkwarden
pkgver=2.16.2
pkgrel=1
pkgdesc="Self hosted bookmark manager"
arch=('x86_64')
url="https://github.com/linkwarden/linkwarden"
license=('AGPL-3.0')
backup=("etc/linkwarden/app.conf")
depends=('nodejs-lts-jod' 'yarn' 'postgresql' 'monolith' 'enchant' 'libwebp' 'nss' 'nspr' 'atkmm' 'libdrm' 'libxcomposite' 'libxdamage' 'libxrandr' 'mesa' 'libxkbcommon' 'pango' 'alsa-lib' 'libcups' 'corepack')
makedepends=()
optdepends=()
options=(!debug)
source_x86_64=(
https://github.com/linkwarden/linkwarden/archive/refs/tags/v$pkgver.tar.gz
app.conf
dbinit.sh
linkwarden.sysusers
linkwarden.tmpfiles
linkwarden.install
linkwarden.service
start.sh
)
sha512sums_x86_64=(
b783dcae33494bc4970fd61af510c3016604ed9914a9bb31e3b2dd521e8e37fb0e1132b820778630100fdfde5768880241f1252c57e3944c33db758b97a6cd37
aeb567c588f903e58c1b87e41bd4a950eb775252226c1534a1621d01f46cfb2f27e32657c40d4b154e150ac9e80b62d7b532aac8d0bb8ce5f28c4a1ca454ce6d
79f547c9b9f69986bc29c97faa102e7cae48f04ba446f89ade4597b858fdaf70afee19846314b8d7cb47fc102f9058fe2d288d2e5cbb7eb50120913d673127bf
ccc4088e8e9732164735781364d73e2d6d393477dd8d2f9b6f6b5aa2209784a08c4ce9350db565e0b6e02e94e590e839ad3b22d468952198fe67c09d75f9d188
d0165dd3671263fadf36364d0d54e3e0c86294c2efb0ca15cefbe618750921c95cebcca57dc37f85ab426a26cff05185844132543e10f92ed283c594462b8074
e82335db56dd96599626dd2436d44871f4fc1c2d25df4c0880d5f84a93f08563552eb25ff722a87ecaa44fe862f3586ef70a5bfc596104a60aebe8b575f263d9
2bcfa2e4580e588b2b0b9f7e994db7ec0b917f9ca9be3b82b724012ca16ce86af1b05ceec88454716e4cdffabc3e480764703568ffaf65a8f20f1ee2e54d2a77
e002bffa583897e83730d00c4083aa430735e6fbea921748bc104606c58d6cab1fc7365660e627a51267411a3ae74365079ce54033db4a09d194007f718a59f5
)

build() {
    # https://github.com/microsoft/playwright/issues/2621#issuecomment-931530175
    cd "${srcdir}"

    cd linkwarden-$pkgver
    sed -i 's|playwright install --with-deps chromium|:|' apps/web/package.json
    mkdir -p bin
    # If user has libvips installed, the build will fail 
    export SHARP_IGNORE_GLOBAL_LIBVIPS=true
    corepack enable --install-directory bin
    corepack yarn
    corepack yarn prisma:generate
    corepack yarn web:build
}

package() {

mkdir -p $pkgdir/usr/share/webapps/linkwarden
install -Dm 644 ${srcdir}/app.conf $pkgdir/etc/linkwarden/app.conf
install -Dm 744 ${srcdir}/dbinit.sh $pkgdir/usr/share/webapps/linkwarden
install -Dm 744 ${srcdir}/start.sh $pkgdir/usr/share/webapps/linkwarden
cp -Ra $srcdir/linkwarden-$pkgver/{*,.*} $pkgdir/usr/share/webapps/linkwarden
install -Dm 644 ${srcdir}/linkwarden.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/linkwarden.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=linkwarden.install
install -Dm 644 ${srcdir}/linkwarden.service -t "$pkgdir"/usr/lib/systemd/system/
}
