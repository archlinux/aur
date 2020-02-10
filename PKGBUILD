# Maintainer: Kars Wang <jaklsy g-mail>

pkgname=lantern-headless
pkgver=5.6.4
pkgrel=1
_pkgname=lantern
_git_revision=2ea216c
# git show -s --format=%ci "${_git_revision}"
_git_revision_date='2015-09-01 23:11:32 -0700'
_build_date="$(date -u '+%Y%m%d.%H%M%S')"
_logger_token='469973d5-6eaf-445a-be71-cf27141316a1'
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the open Internet. (Headless Version)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
depends=('bzip2' 'dbus' 'glib2' 'mesa' 'xcb-util' 'xdg-utils' 'zlib')
makedepends=('go>=1.4')
provides=('lantern')
options=('!emptydirs' '!strip')
source=("https://github.com/getlantern/lantern/archive/${pkgver}.tar.gz"
        'lantern.service')
sha512sums=('1e5974a61af9347946d56c4d565849538407f1a8f97fd6310454a87bcedc0a7a78ef7bcc4761499daf38a050ae70e1e2583980580147310e14da2d641458fe44'
            '540e0500459642207c26601cacef67df052464a604563f121819b549e54e9559bbf5a7ff31b2c9f12382cba4b07e435437d818a37fb9be300119a06ef466c496')

if [ "$CARCH" = 'i686' ]; then
    _arch='386'
elif [ "$CARCH" = 'x86_64' ]; then
    _arch='amd64'
fi

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    source ./setenv.bash
    local build_tags='prod headless'
    local _logger_token="$(sed -n 's/^LOGGLY_TOKEN[[:space:]]*:=[[:space:]]\(.*\)$/\1/p' ./Makefile)"
    local ldflags="-w -X \"main.version=${_git_revision}\" -X \"main.revisionDate=${_git_revision_date}\" -X \"main.buildDate=${_build_date}\" -X \"github.com/getlantern/flashlight/logging.logglyToken=${_logger_token}\""

    sed "s/packageVersion.*/packageVersion = \"${pkgver}\"/" ./src/github.com/getlantern/flashlight/autoupdate.go | sed 's/!prod/prod/' > ./src/github.com/getlantern/flashlight/autoupdate-prod.go

    CGO_ENABLED=1 GOOS=linux GOARCH="$_arch" go build -o "lantern_linux_${_arch}" -tags="$build_tags" -ldflags="${ldflags} -linkmode internal -extldflags \"-static\"" ./src/github.com/getlantern/flashlight
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    local installer_resources='./installer-resources/linux'
    local packaged_yaml='.packaged-lantern.yaml'
    local packaged_settings=''

    install -Dm644 <(echo "$packaged_settings") "${pkgdir}/usr/lib/lantern/${packaged_yaml}"
    install -Dm644 "./lantern_linux_${_arch}" "${pkgdir}/usr/lib/lantern/lantern-binary"
    install -Dm755 "${installer_resources}/lantern.sh" "${pkgdir}/usr/lib/lantern"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s '/usr/lib/lantern/lantern.sh' "${pkgdir}/usr/bin/lantern"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/lantern.service" "${pkgdir}/usr/lib/systemd/user/lantern.service"
}
