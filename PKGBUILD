# Maintainer: Kars Wang <jaklsy g-mail>

pkgname=lantern-headless
pkgver=2.0.2
pkgrel=1
_pkgname=lantern
_git_revision=365c62b
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
sha1sums=('bd2a791c188f2f7a9fb2455eb8b888dcff93f490'
          '822a905e8fe1d221a7ac5b7f0417d4ab82bed45a')

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
