# Maintainer: Scott Tincman <sctincman at gmail dot com>

pkgname=nwchem
pkgver=6.5.20150331
pkgrel=1
pkgdesc="Ab initio computational chemistry software package"
arch=('i686' 'x86_64')
url="http://www.nwchem-sw.org/index.php/Main_Page"
license=('custom:ECL')
depends=('openmpi' 'python2')
makedepends=('gcc' 'gcc-fortran' 'bash' 'lapack')
optdepends=()
install=nwchem.install
source=("http://www.nwchem-sw.org/download.php?f=Nwchem-6.5.revision26243-src.2014-09-10.tar.gz"
	http://www.nwchem-sw.org/images/{Bcast_ccsd,Dmapp_inc,Elpa_syncs,Hbar,Hnd_giaxyz_noinline,Hnd_rys,Ifort15_fpp_offload,Makefile_gcc4x,Parallelmpi,Print1e,Tcenxtask,Tddft_grad,Texas_iorb,Util_md_sockets,Xlmpoles_ifort15}.patch.gz
	"config.sh"
	"nwchemrc")
sha256sums=('9af6d7d7424809785f5a833b49d526cb3e8b5703a9e061a52e426532c48f8c75'
              '03e0d06033a02be4f1eb659212744c822041d4619b38b48c44284bc80df4ebaf'
              '58e25a87d9a2844eaaae542ffa244c55c1075b040b7206771167e6458d9ca756'
              'ce5c45cf83d84e0a95266e667808e6e40df82e649db3b9faeb556f1e3724b8df'
              '6058010a77bc7d0bf7468dde49d7905863f2550b282abee4cceef901481272a7'
              '4e89a383ebd0cc87b3de03133f4a0537de799e1ae938f82a6460632e324aeeb1'
              'e52eee4df9149cce039b4b1d8047d51a5f47373fe03b57c6d0f44ca23b33c06e'
              '907d86049b085bc4c2b9cb2e2554fba94e54e0cb2e380f9d4c5c6ea483c16915'
              'c548c64eab196ef7aabd473379ec56c879c5a6e9e9a4d31c6503279a72094839'
              'd30de8a7027bd5ea7672ad1fa63711a3cfc5cb118f878bc5308a142319d31420'
              '59c4d96c9da4b7fb08dee2a89afcbc6ac603c141d48cf3a16e41a92dc2a539e5'
              '6b3f713024fec9a41bd7738e3cd6d31731d17a3b59a02d9a484e0a2408fcb9ca'
              '73028f7e1d5cae1f3b1e31d30accbaec519a073696d96110ebba02cb6735ba9f'
              '0caab84a2b9628a65232c24364c45ab29dd8637b0b29b15e1d089005eda20745'
              '843d0d9152a3d3735557a8710ae8c6a260732a2b8e0d9ed823bbd430efff44ee'
              'ae957064165afe8abcfeb580146b59b8ca680a7a5f528402047b3f8672c1e131'
              'a4bcc6025adbc2fda50b5efebaabce87260c73430dcab3141eebbb0234e45fbb'
              'd63fdfc44a8f44419748e029d031c91716635ac4f062cd835014cde04677b90f')

prepare() {
    cd $srcdir
    #Pieces of script/fortran have 65 character limit, this should help avoid it
    mv Nwchem-6.5.revision26243-src.2014-09-10 nwchem-6.5

    cd "$srcdir/nwchem-6.5/src"

    patch -p0 < "$srcdir"/Bcast_ccsd.patch
    patch -p0 < "$srcdir"/Dmapp_inc.patch
    patch -p0 < "$srcdir"/Elpa_syncs.patch
    patch -p0 < "$srcdir"/Hbar.patch
    patch -p0 < "$srcdir"/Hnd_rys.patch
    patch -p0 < "$srcdir"/Ifort15_fpp_offload.patch
    patch -p0 < "$srcdir"/Makefile_gcc4x.patch
    patch -p0 < "$srcdir"/Parallelmpi.patch
    patch -p0 < "$srcdir"/Print1e.patch
    patch -p0 < "$srcdir"/Tcenxtask.patch
    patch -p0 < "$srcdir"/Tddft_grad.patch
    patch -p0 < "$srcdir"/Texas_iorb.patch
    patch -p0 < "$srcdir"/Util_md_sockets.patch
    patch -p0 < "$srcdir"/Xlmpoles_ifort15.patch
    cd "$srcdir/nwchem-6.5/src/NWints/hondo"
    patch -p0 < "$srcdir"/Hnd_giaxyz_noinline.patch
}

build() {
    cd "$srcdir/nwchem-6.5"

    source ${srcdir}/config.sh

    if test "$CARCH" == x86_64; then
	export TARGET=LINUX64
	export NWCHEM_TARGET=LINUX64
    else
	export TARGET=LINUX
	export NWCHEM_TARGET=LINUX
    fi

    cd src
    make nwchem_config
    make
}

package() {

    if test "$CARCH" == x86_64; then
	export TARGET=LINUX64
    else
	export TARGET=LINUX  
    fi

    cd "$srcdir/nwchem-6.5"

    install -d -m 755 $pkgdir/usr/bin
    install -m 755 $srcdir/nwchem-6.5/bin/${TARGET}/nwchem $pkgdir/usr/bin/

    install -d -m 755 $pkgdir/usr/share/nwchem/
    cp -r $srcdir/nwchem-6.5/src/basis/libraries $pkgdir/usr/share/nwchem/
    cp -r $srcdir/nwchem-6.5/src/data $pkgdir/usr/share/nwchem/

    install -d -m 755 $pkgdir/usr/share/nwchem/libraryps
    cp -r $srcdir/nwchem-6.5/src/nwpw/libraryps/{development_psps,HGH_LDA,library1,library2,ofpw_default,paw_default,pspw_default,pspw_new,pspw_old,Spin_Orbit,TETER,TM} $pkgdir/usr/share/nwchem/libraryps
    # ugh...
    chmod -R go=rX $pkgdir/usr/share/nwchem/
    chmod -R u=wrX $pkgdir/usr/share/nwchem/

    install -d -m 755 $pkgdir/etc/skel/
    install -m 644 $srcdir/nwchemrc $pkgdir/etc/skel/.nwchemrc

    install -d -m 755 $pkgdir/usr/share/licenses/nwchem
    install -m 0644 $srcdir/nwchem-6.5/LICENSE.TXT $pkgdir/usr/share/licenses/nwchem/
}

check()
{
    cd "$srcdir/nwchem-6.5"

    source ${srcdir}/config.sh
    
    if test "$CARCH" == x86_64; then
	export TARGET=LINUX64
	export NWCHEM_TARGET=LINUX64
    else
	export TARGET=LINUX
	export NWCHEM_TARGET=LINUX
    fi

    cd QA
    bash doqmtests_bash
}
