# Maintainer: Denis Dyakov <denis.dyakov@gmail.com>

pkgname=gorsync-git
_pkgname=go-rsync
pkgver=0.3.3
epoch=
pkgrel=1
pkgdesc="Best GTK+ client frontend for RSYNC console utility."
arch=('x86_64' 'i686')
url="https://github.com/d2r2/go-rsync"
license=('GPL3')
makedepends=('git' 'go')
depends=('rsync' 'glib2' 'gtk3' 'libnotify')
provides=('gorsync')
install="${pkgname}.install"
source=("${_pkgname}"::'git+https://github.com/d2r2/go-rsync.git')
md5sums=('SKIP')

# Get the tag of the commit to use
# Separated out to allow for `makepkg -e` not running prepare()
_get_tag() {
  _tag=$(git tag --list | grep '^v' | grep -v alpha | tail -n1)
  echo "Selected git tag: $_tag" >&2  # To STDERR as called from pkgver()
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  _get_tag
  git reset --hard "${_tag}"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  [[ -z ${_tag-} ]] && _get_tag
  # Example: v2.1.0-beta-3  ->  2.1.0.beta.r3
  # Version specification: https://github.com/robert7/nixnote2/issues/28
  # echo "$_tag" | sed -E 's/^v//;s/-?([0-9]+)$/.r\1/;s/-/./'
  echo "${_tag}" | sed 's/^v//;s/-/./g'
}


#pkgver() {
#    cd "${srcdir}/${_pkgname}"
#    git describe --tags --long | sed 's/^v//;s/-/./g'
#}

build() {
    rm -rf "${srcdir}/.go/src"
    mkdir -p "${srcdir}/.go/src/github.com/d2r2"
    # export GOPATH="${srcdir}/.go"
    mv "${srcdir}/${_pkgname}" "${srcdir}/.go/src/github.com/d2r2/"
    cd "${srcdir}/.go/src/github.com/d2r2/${_pkgname}/"
    # download and build main package and all dependencies
    # retrying n times, due to issue with go get functionality
    n=0
    until [ $n -ge 7 ]
    do
        GOPATH="${srcdir}/.go" go get -v all && \
            GOPATH="${srcdir}/.go" ./gorsync_build.sh --buildtype Release && \
            break  # substitute your command here
        n=$[$n+1]
        sleep 1
    done
}

package() {
    _binname="gorsync"
    # echo "Working dir $(pwd)"
    cd "${srcdir}/.go/src/github.com/d2r2/${_pkgname}"
    install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
    install -Dm644 "builds/fpm_packages/gorsync.desktop" "$pkgdir/usr/share/applications/gorsync.desktop"
    install -Dm644 "ui/gtkui/gsettings/org.d2r2.gorsync.gschema.xml" "$pkgdir/gsettings/org.d2r2.gorsync.gschema.xml"
    # install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

