# Mantainer: Jens Staal <staal1978@gmail.com>
# Contributor : ackalker
# Modified from open_watcom: Felix Stirlitz <m.p.isaev@yandex.com>
# adjust the configuration below to change options
pkgname=openwatcom-v2
pkgver=2.0
pkgrel=3
pkgdesc="The Open Watcom Fortran/C/C++ compiler, binary distribution -V2 fork"
arch=('any')
#url="http://www.openwatcom.org"
url="https://github.com/open-watcom"
license=('custom:OWPL-1')
source=( 'http://downloads.sourceforge.net/project/openwatcom/current-build/open-watcom-2_0-c-linux-x86'
	 'http://downloads.sourceforge.net/project/openwatcom/current-build/open-watcom-2_0-f77-linux-x86')
noextract=( 'open-watcom-2_0-c-linux-x86' 'open-watcom-2_0-f77-linux-x86' )
#md5sums change frequently since it is a snapshot. If it fails, download manually and check md5sum
#sums can be found at:
#http://optimate.dl.sourceforge.net/project/openwatcom/current-build/sums.md5
#any automatic way to import those?
md5sums=('SKIP' 'SKIP')
options=(!strip)

build() {
    chmod +x ./open-watcom-2_0-f77-linux-x86
    chmod +x ./open-watcom-2_0-c-linux-x86
}

package() {
#all possible cross compile targets enabled by default
	_tmpnam="$(mktemp /tmp/options.$$.XXXXXXXXX)"
	sed -e 's/#.*$//g' >"$_tmpnam" <<EOF
ms=true                        # small memory model libraries
mm=true                        # medium memory model libraries
mc=true                        # compact memory model libraries
ml=true                        # large memory model libraries
mh=true                        # huge memory model libraries
doshost=false                   # DOS host binaries
os2host=false                  # OS/2 host binaries
dostarg=true                   # DOS target libraries
os2targ=true                  # OS/2 target libraries
nlmtarg=true                  # Novell Netware target
rdoshost=false                 # RDOS host binaries
rdostarg=true                 # RDOS target libraries
lnxhost=true                   # Linux host binaries
lnxtarg=true                   # Linux target libraries
winhost=false                  # Windows host binaries
wnthost=false                  # Windows NT host binaries
wintarg=true                   # Windows target libraries
wnttarg=true                   # Windows NT target libraries
tools16=true                   # 16-bit tools
samples=true                   # Samples
helpfiles=false                # Help files
win16_helpfiles=false          # Win16 help files
win32_helpfiles=false          # Windows NT help files
htmlhelp_helpfiles=false       # CHM help files
whelp_helpfiles=false          # WHELP help files
os2_helpfiles=false            # OS/2 help files
pdf_helpfiles=true             # PDF help files
rtsource=true                  # Runtime library source
3r=true                        # Register calling convention libraries
3s=true                        # Stack calling convention libraries
cplusplus=true	               # C++ support
EOF
	TERM=linux ./open-watcom-2_0-f77-linux-x86 -i -dDstDir="$pkgdir/opt/watcom" -dOWDir="/opt/watcom" -f="$_tmpnam"
	TERM=linux ./open-watcom-2_0-c-linux-x86 -i -dDstDir="$pkgdir/opt/watcom" -dOWDir="/opt/watcom" -f="$_tmpnam"
	install -d "$pkgdir/usr/share/licenses/watcom"
	install -Dm644 "$pkgdir/opt/watcom/license.txt" "$pkgdir/usr/share/licenses/watcom/license.txt"
	_pkgdirsane="$(echo "$pkgdir" | sed -e 's,[\[^$.+*\\?],\\&,g')"
	sed -i -e "s,$_pkgdirsane,," "$pkgdir/opt/watcom/owsetenv.sh"
	rm -f "$_tmpnam"

	msg "correct permissions for header directories"
	chmod -R 755 $pkgdir/opt/watcom/{h,lh}
	
	msg "adding some fake binaries to make life easier"
	cd $pkgdir/opt/watcom/binl
	ln -s /usr/bin/true ranlib
	ln -s wlib ar
} 
