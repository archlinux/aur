# Maintainer: vetu104 <janne.p.w.vetelainen@gmail.com>
# Contributor: Viste <viste02@gmail.com> 
# Contributor: alrii <alrii@gmail.com> 
# Contributor: jjpk <julienjpk@email.com>
# Contributor: Benjamin Chrétien <chretien at lirmm dot fr>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Gereon Schomber <Gereon_Schomber@fastmail.fm>
# Contributor: Alex Belanger <i.caught.air@gmail.com>

pkgname=ace
_pkgver=7_1_3
pkgver=7.1.3
pkgrel=3
pkgdesc="Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems."
arch=('x86_64')
url="https://www.dre.vanderbilt.edu/~schmidt/ACE.html"
license=('LicenseRef-DOC')
depends=('gcc-libs' 'glibc')
makedepends=('perl')
provides=('libACE.so' 'libACEXML.so' 'libACEXML_Parser.so'
    'libACEXML_XML_Svc_Conf_Parser.so' 'libACE_Compression.so'
    'libACE_ETCL.so'  'libACE_ETCL_Parser.so' 'libACE_HTBP.so' 'libACE_INet.so'
    'libACE_Monitor_Control.so' 'libACE_RLECompression.so' 'libACE_RMCast.so'
    'libACE_TMCast.so' 'libKokyu.so'
)


source=("https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${_pkgver}/ACE-src-${pkgver}.tar.gz")
sha256sums=('105a2705dddb3c93e486028f63a33ec0f3f6dbcd63cdd166f34f5d5da35ab5ac')

prepare() {
    export ACE_ROOT="$srcdir/ACE_wrappers"
    cd "$ACE_ROOT"

    # Built a select subset of components in the ACE release
    # Inspired by Debian
    cat <<-EOF > "$ACE_ROOT/ACE.mwc"
	workspace {
	    exclude {
	        apps/gperf/tests
	        apps/Gateway
	        apps/JAWS
	        apps/JAWS2
	        apps/JAWS3
	        apps/drwho
	        apps/mkcsregdb
	        apps/soreduce

	        ACEXML/tests
	        Kokyu/tests
	        ACEXML/examples
	        netsvcs/clients
	        protocols/examples

	        ASNMP
	        MPC
	        examples
	        performance-tests
	        websvcs
	    }
	}
	EOF
}

build() {
    export ACE_ROOT="$srcdir/ACE_wrappers"
    cd "$ACE_ROOT"

    cat <<-EOF > "$ACE_ROOT/ace/config.h"
	#include "ace/config-linux.h"
	EOF

    cat <<-EOF > "$ACE_ROOT/include/makeinclude/platform_macros.GNU"
	INSTALL_PREFIX = /usr
	include \$(ACE_ROOT)/include/makeinclude/platform_linux.GNU
	EOF

    #cat <<-EOF > "$ACE_ROOT/bin/MakeProjectCreator/config/default.features"
	#EOF

    "$ACE_ROOT/bin/mwc.pl" -type gnuace ACE.mwc
    make
}

# Some of these tests can fail due to network configuration
# E.g. multicast blocked in firewall
#check() {
#    export ACE_ROOT="$srcdir/ACE_wrappers"
#    export LD_LIBRARY_PATH="$ACE_ROOT/lib:$LD_LIBRARY_PATH"
#    cd "$ACE_ROOT"
#
#    "$ACE_ROOT/bin/auto_run_tests.pl" -Config FIXED_BUGS_ONLY 2>&1 | tee tests.log
#
#    local status=0
#
#    echo "--- Failed tests:"
#    if grep "auto_run_tests_finished" tests.log | grep -v "Result:0"; then
#        status=1
#    fi
#    echo "---"
#
#    return "$status"
#}

package() {
    export ACE_ROOT="$srcdir/ACE_wrappers"
    cd "$ACE_ROOT"
    make DESTDIR="$pkgdir/" install
    rm -rf "$pkgdir/usr/share/ace/include"
    rm -rf "$pkgdir/usr/share/ace/bin"
    rm "$pkgdir/usr/share/ace/ace-devel.sh"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
