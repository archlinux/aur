# Maintainer: Sergey Poluyan <svpoluyan AT gmail DOT com>
# Contributor: Christian Ponte <chponte AT pm DOT me>

##########################################################################

# Intel Advisor standalone version PKGBUILD script
# Copyright 2020 Christian Ponte
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

pkgname=intel-advisor-standalone
pkgver=2026.0.0.266
pkgrel=1
pkgdesc="Intel Advisor for oneAPI (standalone version) – design and analysis tool for performant code"
arch=('x86_64')
url="https://www.intel.com/content/www/us/en/developer/tools/oneapi/advisor.html"
license=('custom')
depends=(
    'glibc'
    'qt6-base'
    'libxcb'
    'libxkbcommon'
    'at-spi2-atk'
    'gtk3'
    'level-zero-loader'
)
makedepends=()
optdepends=(
    'nss: GUI improvements'
    'xdg-utils: opening documentation'
)
conflicts=('intel-advisor')
provides=("intel-advisor=${pkgver}")
install="intel-advisor.install"
source=(
    "intel-advisor-${pkgver}.sh::https://registrationcenter-download.intel.com/akdlm/IRC_NAS/68057580-a03d-4490-87e2-b2a6092b6675/intel-advisor-2026.0.0.266_offline.sh"
    "intel-advisor.desktop"
    "intel-advisor.png"
)
sha384sums=(
    '02aa34c8fb76bf4e97a2d1bd1500f5f9ccce542c2cdf304b239298228663975dea8bd3a52a2297e1921a0975e4674014' # from intel dot com offline linux version
    '6d9ae2c2403aa397e5d6de4dcaa7090cf12358b5834a47e7ca56db2c613087eab20fff7c703233ebf2c7f8cd26b954c7'
    '5ee33b385752148cccaa82d6bb586c3e5ec7f272ca7f1a8cd5420392a5e4367ab4bed141b8621c9a360e5cad06a85f9a'
)
options=(!strip)
noextract=("intel-advisor-${pkgver}.sh")

build() {
    sh "${srcdir}/intel-advisor-${pkgver}.sh" \
        --extract-folder "${srcdir}" \
        --extract-only \
        --remove-extracted-files no \
        --log "${srcdir}/extract.log"
}

package() {
    LD_PRELOAD="" "${srcdir}/intel-advisor-${pkgver}_offline/install.sh" \
        --silent \
        --eula accept \
        --components all \
        --install-dir "${pkgdir}/opt/intel/oneapi" \
        --log-dir "${srcdir}" \
        --ignore-errors

    rm -rf "${pkgdir}/opt/intel/oneapi/logs"

    local vars_sh=$(find "${pkgdir}/opt/intel/oneapi/advisor" -name "vars.sh" | head -1)
    if [[ -n $vars_sh ]]; then
        mkdir -p "${pkgdir}/etc/profile.d"
        ln -s "$vars_sh" "${pkgdir}/etc/profile.d/advixe-vars.sh"
    fi

    install -Dm644 "${srcdir}/intel-advisor.png" \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/intel-advisor.png"

    install -Dm644 "${srcdir}/intel-advisor.desktop" \
        "${pkgdir}/usr/share/applications/intel-advisor.desktop"

    install -Dm644 "${srcdir}/intel-advisor-${pkgver}_offline/license.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}