# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.6.0
pkgrel=1
_pgrel=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=('x86_64')
url="https://github.com/mfat/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mfat/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glib2' 'gtk4' 'gdk-pixbuf2' 'libsecret' 'pango' 'graphene' 'vte4' 'libadwaita' 'python'
 'python-paramiko' 'python-gobject' 'python-keyring' 'python-psutil'  'python-cairo' 'python-cryptography' 
 'python-matplotlib' 'libadwaita' 'vte4' 'sshpass' 'libsecret')

options=(!strip)

source=("https://raw.githubusercontent.com/mfat/${_pkgname}/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${_pgrel}_all.deb")
sha512sums=('714d66c4a17e6dfc1553521af2be03f4579fac64048c0b96c592177562b01fc70a8e184bb21725e11ef96a54bf466ae1abd4992b8940f0fe2c0859d6a166a2ef')
sha512sums_x86_64=('dac199c5cc468bfc8f20792336f0cc8c8728e70db256a4f21c39958db163d990ece9325d827aa0637b434d23f0e36eccc3bd62f0a2a19355075b252951f067b9')

package() {
    cd "${pkgdir}"
    local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    # Fix: Install files properly from the correct location in the extracted package
    install -d "${pkgdir}${site_packages}/sshpilot" "${pkgdir}${site_packages}/sshpilot/resources" "${pkgdir}${site_packages}/sshpilot/ui"
    
    install -Dm644 "${pkgdir}/usr/lib/python3/dist-packages/sshpilot"/*.py "${pkgdir}${site_packages}/sshpilot/"
    install -Dm644 "${pkgdir}/usr/lib/python3/dist-packages/sshpilot/resources"/* "${pkgdir}${site_packages}/sshpilot/resources/"
    
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
