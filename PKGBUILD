# Maintainer: Kars Wang <jaklsy g-mail>

pkgname=lantern-headless-git
pkgver=r4078.ce6b7a2
pkgrel=1
_pkgname=lantern
pkgdesc='Lantern is a free desktop application that delivers fast, reliable and secure access to the open Internet. (Headless + Git Version)'
arch=('i686' 'x86_64')
url='https://getlantern.org'
license=('Apache')
depends=('bzip2' 'dbus' 'glib2' 'mesa' 'xcb-util' 'xdg-utils' 'zlib')
makedepends=('go>=1.4')
provides=('lantern')
options=('!emptydirs' '!strip')
source=("$_pkgname"::'git+https://github.com/getlantern/lantern.git'
        'lantern.service')
sha1sums=('SKIP'
          '822a905e8fe1d221a7ac5b7f0417d4ab82bed45a')

if [ "$CARCH" = 'i686' ]; then
    _arch='386'
elif [ "$CARCH" = 'x86_64' ]; then
    _arch='amd64'
fi

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    source ./setenv.bash
    local build_tags='prod headless'
    local git_revision="$(git rev-parse --short HEAD)"
    local git_revision_date="$(git show -s --format=%ci HEAD)"
    local revision_date="$(date -u -d "$git_revision_date" '+%Y%m%d.%H%M%S')"
    local build_date="$(date -u '+%Y%m%d.%H%M%S')"
    local logger_token="$(sed -n 's/^LOGGLY_TOKEN[[:space:]]*:=[[:space:]]\(.*\)$/\1/p' ./Makefile)"
    local ldflags="-w -X \"main.version=${git_revision}\" -X \"main.revisionDate=${revision_date}\" -X \"main.buildDate=${build_date}\" -X \"github.com/getlantern/flashlight/logging.logglyToken=${logger_token}\""

    sed "s/packageVersion.*/packageVersion = \"${pkgver}\"/" ./src/github.com/getlantern/flashlight/autoupdate.go | sed 's/!prod/prod/' > ./src/github.com/getlantern/flashlight/autoupdate-prod.go

    CGO_ENABLED=1 GOOS=linux GOARCH="$_arch" go build -o "lantern_linux_${_arch}" -tags="$build_tags" -ldflags="${ldflags} -linkmode internal -extldflags \"-static\"" ./src/github.com/getlantern/flashlight
}

package() {
    cd "${srcdir}/${_pkgname}"
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
