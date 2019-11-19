# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_extension_name='dashlane'
_extension_id='fdjamakpfbbddfjaooikfcpapjohcfmg'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=78.0&acceptformat=crx2,crx3&x=id%3D'
pkgname="chromium-extension-${_extension_name}"
pkgver=6.1942.1.0
pkgrel=2
pkgdesc='The password manager, perfected'
license=('CUSTOM')
arch=('any')
url='https://www.dashlane.com'
makedepends=('curl')
depends=('chromium')
source=(${_extension_name}.crx::"${_store_base_url}${_extension_id}%26uc"
	"${_extension_id}.json")
sha256sums=('SKIP'
	    '8470694193e7964b7603f881a3936146f50c5e432c39370578351b039f95ab67')
noextract=("${_extension_name}.crx")

pkgver() {
    cd "${srcdir}"
    curl -Ls -o /dev/null -w %{url_effective} ${_store_base_url}${_extension_id}%26uc | rev | cut -d/ -f1 | rev | sed -e 's/extension_//g' -e 's/.crx//g' -e 's/_/./g' | sort | tail -n1
}

prepare() {
    sed -i "s/\/usr\/lib\/x86_64-linux-gnu/\/usr\/lib\/${CARCH}-linux-gnu/" "${_extension_id}.json"
}

package() {
    cd "${srcdir}"

    install -Dm 644 "${_extension_name}.crx"    \
            "${pkgdir}/usr/lib/${CARCH}-linux-gnu/${_extension_name}-chromium/${_extension_name}.crx"

    install -Dm 644 "${_extension_id}.json"     \
            "${pkgdir}/usr/share/chromium/extensions/${_extension_id}.json"
}

