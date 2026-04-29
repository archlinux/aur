# Maintainer: Uthopik <josearrillaga@ik.me>
pkgname=jopdf
pkgver=2.2.0
pkgrel=1
pkgdesc="Free & Fast PDF Editor for Linux"
arch=('x86_64')
url="https://jopdf.com"
license=('LicenseRef-EULA')
depends=('hicolor-icon-theme' 'nss' 'libxss' 'gtk3' 'libxtst' 'alsa-lib' 'java-runtime' 'qt5-base')
options=('!strip')

source=("${pkgname}-${pkgver}.deb::https://cdn.jopdf.com/download/jopdf/jopdf-linux-amd64_setup.deb")
sha256sums=('1bdf771893943a1e96b1b5dcc62af530aaec5059aa09fa80e01b6e03228cb327')

package() {
    # 1. Extracción del contenido
    if [ -f "${srcdir}/data.tar.xz" ]; then
        bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    elif [ -f "${srcdir}/data.tar.zst" ]; then
        bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    fi

    # 2. Corregir permisos (Sobre los archivos reales, ANTES de los links)
    chown -R root:root "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +
    
    # Dar ejecución al binario y librerías
    chmod +x "${pkgdir}/opt/jopdf/JOPDF"
    find "${pkgdir}/opt/jopdf/lib" -name "*.so*" -exec chmod +x {} +

    # 3. Licencia
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat <<EOF > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

End User License Agreement
Read the JOPDF EULA to understand your rights and responsibilities when using our services.
Last Updated August 27, 2025
This License Agreement is a legal agreement between the end user (“Licensee”) and JOPDF (“Licensor”). Under this Agreement, the Licensor grants the Licensee a license to use the Licensed Software. By downloading, installing, accessing, or using our Services, you agree to be bound by the terms of this License Agreement and any other applicable agreements. If you do not agree to the terms, you have no right to the product and should not install, copy, download, access, or use it.

1. GRANT OF LICENSE
JOPDF grants the Licensee a limited, non-exclusive, non-transferable, non-sublicensable, and revocable license to install and use the Services for the purchased period and solely for the Licensee’s private use.
Any use or installation of more copies of the Licensed Software than are licensed is strictly prohibited without prior written consent from the Licensor. If the Licensee is authorized to distribute the Licensed Software within its organization, all restrictions in this License Agreement apply to each individual end user.

2. COPYRIGHT
The Software is owned by JOPDF and is protected by international copyright laws and treaty provisions. The Licensee shall not remove or conceal any proprietary notices, labels, or marks from the Software.

3. OWNERSHIP
The Licensor reserves all rights not expressly granted to the Licensee under this License Agreement. The rights granted are limited to the use of the Licensed Software and do not include any intellectual property rights of the Licensor or third parties.

4. LICENSE LIMITATIONS
The Licensee may not:

Create, use, share, or publish all or any portion of the Licensed Software or Documentation.
Publish, copy, lease, or lend the Licensed Software.
Reverse engineer, decompile, disassemble, or attempt to discover the source code of the Licensed Software.
Modify, distort, disrupt, or slow down the normal functioning of all or part of the Licensed Software.
Use the Licensed Software to host applications for third parties, or as part of facility management, timesharing, service provider, or service bureau arrangements.
Transmit any virus, Trojan horse, worm, bomb, corrupted file, or use the Licensed Software in any illegal or unauthorized manner.

5. TERMINATION
The term of this License Agreement corresponds to the License type and/or duration purchased, starting from the date of purchase, download, or account activation, until terminated according to its terms.

At the end of the term, the Licensee must uninstall and permanently delete or destroy all but one copy of the Licensed Software within thirty (30) days of termination or expiration. This Agreement terminates automatically if the Licensee fails to comply with any terms or conditions. Upon termination for any reason, the Licensee shall return all copies of the Licensed Software to the Licensor or provide written confirmation that all copies have been destroyed.

6. NO WARRANTY ON LICENSED SOFTWAR
SUBJECT TO APPLICABLE LAW, THE LICENSED SOFTWARE IS PROVIDED “AS IS.” THE LICENSOR, AND THE LICENSOR’S SUPPLIERS OR AFFILIATES, MAKE NO WARRANTY REGARDING ITS USE OR PERFORMANCE.

THE LICENSOR AND ITS AFFILIATES DISCLAIM ALL WARRANTIES, CONDITIONS, REPRESENTATIONS, OR TERMS (EXPRESS OR IMPLIED, BY STATUTE, COMMON LAW, CUSTOM, USAGE, OR OTHERWISE), INCLUDING BUT NOT LIMITED TO WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, INTEGRATION, SATISFACTORY QUALITY, OR FITNESS FOR A PARTICULAR PURPOSE, EXCEPT WHERE SUCH WARRANTIES CANNOT BE EXCLUDED OR LIMITED BY APPLICABLE LAW IN THE LICENSEE’S JURISDICTION.
EOF

    # 4. Ajustar el archivo .desktop
    sed -i 's|/opt/jopdf/JOPDF|jopdf|g' "${pkgdir}/usr/share/applications/jopdf.desktop"

    # 5. Crear el enlace simbólico (AL FINAL)
    # Lo creamos después del chmod para que no de error de "enlace colgado"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/jopdf/JOPDF "${pkgdir}/usr/bin/jopdf"
}