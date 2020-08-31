# Maintainer: Christian Ponte <chponte AT pm DOT me>

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
pkgver=2020.u2
pkgrel=1
pkgdesc="The standalone version of Intel Advisor"
arch=('x86_64')
url="https://software.intel.com/content/www/us/en/develop/tools/advisor.html"
license=('custom')
depends=('glibc' 'attr')
makedepends=('git' 'gettext')
conflicts=('intel-advisor')
source=(
    "http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/16786/advisor_2020_update2.tar.gz"
    "intel-advisor.png"
    "intel-advisor.desktop"
    "license.txt"
)
sha256sums=(
    '96ed9a2a9cdda0ab64a535b321feb7ae6e62efefc9d93868bb1476c85973e132'
    'fda3789f672fbb71402a26d5b06fe9845c433f17f17ad08d04470713b9043078'
    'f2822853a9809c05663794291ee204c4f0867a140c511fc5fd9c8173ab12fa39'
    'e13bba8c55cf874988dbb541d8a72f53dd0942fca48f49bfbe9d82174bb73808'
)

build() {
    echo -e "IMPORTANT INFORMATION ABOUT YOUR RIGHTS, OBLIGATIONS AND THE USE"
    echo -e "OF YOUR DATA - PLEASE READ AND AGREE BEFORE DOWNLOADING,"
    echo -e "INSTALLING, COPYING OR USING"
    echo -e ""
    echo -e "The Materials about to be installed are under the End User License"
    echo -e "Agreement for the Intel(R) Software Development Products (Version"
    echo -e "October 2018). A copy of the license is included with it."
    echo -e ""
    echo -e "By downloading, installing, copying or otherwise using the"
    echo -e "Materials, You agree to be bound by the terms of this Agreement."
    echo -e "If You do not agree to the terms of this Agreement, do not"
    echo -e "download, install, copy or otherwise use the Materials. This"
    echo -e "Agreement forms a legally binding contract between you, or the"
    echo -e "company or other legal entity (\"Legal Entity\") for which you"
    echo -e "represent and warrant that you have the legal authority to bind"
    echo -e "that Legal Entity, (each, \"You\" or \"Your\") and Intel"
    echo -e "Corporation and its subsidiaries (collectively \"Intel\")"
    echo -e "regarding Your use of the Materials.  You affirm that You are 18"
    echo -e "years old or older or, if not, Your parent, legal guardian or"
    echo -e "Legal Entity must agree and enter into this Agreement on your"
    echo -e "behalf."
}

package() {
    # Extract rpms
    for file in $(find $srcdir -name "*.rpm"); do
        bsdtar -xf $file -C $pkgdir;
    done
    # Create opt/intel/advisor link
    ln -rs $(find $pkgdir -type d -name "advisor_20*") $pkgdir/opt/intel/advisor
    # Copy icon file
    mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps &&
    cp $srcdir/intel-advisor.png \
        $pkgdir/usr/share/icons/hicolor/64x64/apps/intel-advisor.png
    # Copy desktop file
    mkdir -p $pkgdir/usr/share/applications && \
    cp $srcdir/intel-advisor.desktop \
        $pkgdir/usr/share/applications/intel-advisor.desktop
    # Copy license file
    mkdir -p $pkgdir/usr/share/licenses/$pkgname && \
    cp $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
    # Create link in /etc/profile.d/
    mkdir -p $pkgdir/etc/profile.d && \
    ln -s /opt/intel/advisor/advixe-vars.sh $pkgdir/etc/profile.d/advixe-vars.sh
}
