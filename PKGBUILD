# Maintainer: adytzu2007 <adybac "at" gmail {dot} com>

pkgname=thinlinc-server
pkgver=4.5.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux Remote Desktop Server"
arch=('i686' 'x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('python2' 'net-tools' 'procps-ng' 'xorg-xauth' 'pcsclite'
         'java-environment')

# to get download link, register here
# http://www.cendio.com/downloads/server/register.py
_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip"
        'tlwebaccess.service'
        'tlwebadm.service'
        'vsmagent.service'
        'vsmserver.service'
        'service.patch')
sha256sums=('449d9480637918f0d4dcb09a2b5428a58a1458c25d8b2c545fedf4f8e45bd9a0'
            '430bcbc959ab363a270fd830c9db8caa057dfbfde69beb6193958c282bd03f7d'
            'cbbf364b9303ff55a7fef434bddab7533f95b8228f045e232fd1c83b78a9a842'
            'b64dcb2ecfb38120a3314b14c114fbf79ecdf699984db7addadd3aec644165da'
            '3e0fdaeca38f4750c9b369a65b7b3c84dff996e9997dbb02dbfe16dc78a09849'
            '635a76ce5f501608ac77b3a396faee57c4bfba82ade2d38d37e657d147a745fd')

_extract_dir="extract"

build()
{
    cd "${srcdir}/${_archive_name}"

    cd packages
    mkdir -p "${_extract_dir}"

    for rpm in *${CARCH}*rpm *noarch*rpm; do
        bsdtar -C "${_extract_dir}" -xf "${rpm}"
    done

    pushd "${_extract_dir}"

    # Patch thinlinc-server to allow installing on a system with systemd
    pushd "opt/thinlinc/libexec"
    patch -p1 < ${srcdir}/service.patch
    popd

    mkdir -p "usr"
    [[ "$CARCH" == "x86_64" ]] && mv "lib64" "usr/lib"

    rm -Rf "etc/init.d"
}

package()
{
    cd "${srcdir}/${_archive_name}/packages/${_extract_dir}"

    cp -aR * "${pkgdir}"

    install -D -m0644 ${srcdir}/tlwebaccess.service ${pkgdir}/usr/lib/systemd/system/tlwebaccess.service
    install -D -m0644 ${srcdir}/tlwebadm.service ${pkgdir}/usr/lib/systemd/system/tlwebadm.service
    install -D -m0644 ${srcdir}/vsmagent.service ${pkgdir}/usr/lib/systemd/system/vsmagent.service
    install -D -m0644 ${srcdir}/vsmserver.service ${pkgdir}/usr/lib/systemd/system/vsmserver.service
}
