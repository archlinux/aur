# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

#TODO: set up permissions (e.g. fortress/{progs,sounds, etc.} to be sticky-bit and writable? that way maybe at least files can be downloaded. create maps dir for all mods too.
#TODO: change permissions for all .cfg's to 664?
#TODO: way to force mode/ownership of newly created files? umask per dir?
# NOTE: as of 2.3-8, with pacman 5 there is crippled support for split-package. so we build one friggin' huge thing.
# sorry, community- i do hope someday that pacman devs stop making arbitrary changes on a whim.

pkgname=('nquakesv')
pkgver=1.4
pkgrel=1
pkgdesc="The easiest, quickest, and most popular QuakeWorld server."
url="http://nquake.com/"
license=('GPL2' 'custom')
depends=('unzip' 'ezquake')
conflicts=('nquake')
arch=('any')
install=nquakesv.install
_pkgname=nquake

_alt_pkgver=$(echo ${pkgver} | sed -e 's/\.//g')

# http://nquake.sourceforge.net/nquake.ini for list of mirrors
#_nQ_MIRROR="http://quakeservers.nquake.com" # NL
_nQ_MIRROR="http://fnu.nquake.com" # Uppsala, SE
#_nQ_MIRROR="http://quake.tdhack.com/nquake" # FR
#_nQ_MIRROR="http://nquake.quake1.de" # DE

source=("${_nQ_MIRROR}/sv-gpl.zip"
	"${_nQ_MIRROR}/sv-non-gpl.zip"
	"${_nQ_MIRROR}/qsw106.zip"
	"CC0-1.0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
	"nquakesv.run"
	"sv-gpl.zip.sig"
	"sv-non-gpl.zip.sig"
	"CC0-1.0.sig"
	"qsw106.zip.sig"
	"nquakesv.run.sig")

source_x86_64=("${_nQ_MIRROR}/sv-bin-x64.zip"
	       "sv-bin-x64.zip.sig")
source_x86=("${_nQ_MIRROR}/sv-bin-x86.zip"
	    "sv-bin-x86.zip.sig")

if [[ "${CARCH}" == 'x86_64' ]];
then
	BITNESS='64'
elif [[ "${CARCH}" == 'i686' ]];
then
	BITNESS='86'
fi

noextract=('qsw106.zip'
	   "sv-bin-x${BITNESS}.zip")

sha512sums=('6a07601f56aec5d88b3463c09c4482a2d76e5d7efd8ddc24c1b4e9b662152f62070dbb5409c1a801560872c725b5b8b1d41437b7b99c74bdcc1ae88d2be91121'
	    '21e6ef7a58c03e342b501a345fd777472b9d109a95201fa859c99d626845d01cf90d0ce6c42f76f5878795f1bcd549128250b9f8e82fceedb8b1f6534b9a1e32'
	    '32df717a4a8f121358243333c30d8d0e5d43ee04f3ee8175a894199b8932e90ebedc6b687c25207c6191dbf25363307f09f8c1dc767b58e254e015c150217384'
	    '1eb4436f8d58766cbe99db97e5e8c0db8a706376afd291c337de1ba7a6b066d3791dc85ad034bdd54ea336bed6e6e8e7a037d8b04b2773c9c7517b9d9921d1fa'
	    'e7dac93556d63c994d37f2361a48408c924426b81395cacb3229acb3020df66dce62e5734686fba44cc7581567e28e5345f6d7a5638c0c97b8effdab78756111'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP')

sha512sums_x86_64=('eab8feab5148ef9c3d3a8c644cbc7b621b9132c73e1b25cd62eb28a47e9e0ffd9500b665b22c015c9aca2db10a316a5669e7d8569ddaec0a9610e9c477dc225c'
                   'SKIP')
sha512sums_i686=('c4b32e5f409a603adea54206b0ebbebb1b7907d7a56065e7730ca01931de33258e6f859d3d9805ffaf8dff9bcedea26e8455a016fa36b6d08eaf1540b8bbacad'
                 'SKIP')

prepare () {
	unzip -j "qsw106.zip" "ID1/PAK0.PAK"
        unzip -j "qsw106.zip" "LICINFO.TXT"
        unzip -j "qsw106.zip" "README.TXT"
        unzip -j "qsw106.zip" "SLICNSE.TXT"
	# Necessary because bsdtar's absolutely silly and keeps trying to extract the contents of the extracted zip or something. friggin' pacman.
	unzip sv-bin-x${BITNESS}.zip
}

package () {
echo pkg
### BASE ##
	# Most of these files are in gpl.zip
	install -d -m 0750 ${pkgdir}/opt/quake/{id1,qw}
	install -d -m 0750 ${pkgdir}/usr/share/nquake
	install -d -m 0750 ${pkgdir}/usr/share/doc/nquake
	install -d -m 0750 ${pkgdir}/usr/share/licenses/nquake
	install -d -m 0755 ${pkgdir}/usr/bin
	# Fix ezquake packages.
	install -d -m 0770 ${pkgdir}/opt/quake/ezquake/{sb/cache,temp}
	# Implement the following in ezQuake
	#chgrp games ${pkgdir}/usr/bin/ezquake
	#chmod 0750 ${pkgdir}/usr/bin/ezquake

	# And the Business-End(TM). Do the thing.
	install -D -m 0775 ${srcdir}/nquakesv.run ${pkgdir}/usr/bin/nquakesv
	install -D -m 0775 ${srcdir}/mvdsv ${pkgdir}/opt/quake/mvdsv
	install -D -m 0775 ${srcdir}/qwfwd/qwfwd.bin ${pkgdir}/opt/quake/qwfwd
	install -D -m 0775 ${srcdir}/qtv/qtv.bin ${pkgdir}/opt/quake/quaketv
	cp -a ${srcdir}/logs ${pkgdir}/opt/quake/.

## DEMO DATA ##
	install -D -m 0644 ${srcdir}/PAK0.PAK ${pkgdir}/opt/quake/id1/pak0.pak
        install -D -m 0644 ${srcdir}/LICINFO.TXT ${pkgdir}/usr/share/doc/nquake/quake_shareware_license_info.txt
        install -D -m 0644 ${srcdir}/README.TXT ${pkgdir}/usr/share/doc/nquake/quake_shareware_readme.txt
        install -D -m 0644 ${srcdir}/SLICNSE.TXT ${pkgdir}/usr/share/licenses/nquake/quake_shareware.txt

## NON-FREE ##
	# Most of these files are in non-gpl.zip
	install -d -m 0750 ${pkgdir}/opt/quake/qw/{maps}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${_pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/README ${pkgdir}/usr/share/doc/nquake/readme.txt  # nQuake FAQ, credits, etc.

### FORTRESS ##
# TODO
#	# Most of these files are in addon-fortress.zip
#	install -d -m 0750 ${pkgdir}/opt/quake/
#	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
#	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
#	# And the Business-End(TM). Do the thing.
#	cp -a ${srcdir}/fortress ${pkgdir}/opt/quake/.  # The entire mod
#
### ARENA ##
# TODO
#	# Most of these files are in addon-clanarena.zip
#	install -d -m 0750 ${pkgdir}/opt/quake/
#	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
#	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
#	# And the Business-End(TM). Do the thing.
#	cp -a ${srcdir}/arena ${pkgdir}/opt/quake/.  # The entire mod
#	cp -a ${srcdir}/prox ${pkgdir}/opt/quake/.  # QuakeProxy, I think?
## KTX ##
	# Most of these files are in sv-gpl.zip and sv-non-gpl.zip. some are in sv-bin-x${BITNESS}.zip
	cp -a ${srcdir}/ktx ${pkgdir}/opt/quake/.
## QTV ##
	cp -a ${srcdir}/qtv/qtv ${pkgdir}/opt/quake/.
	install -D -m 0644 ${srcdir}/qtv/qtv.cfg ${pkgdir}/opt/quake/qtv.cfg
## QWFWD ##
	install -D -m 0644 ${srcdir}/qwfwd/qwfwd.cfg ${pkgdir}/opt/quake/qwfwd.cfg

## FINISHING TOUCHES ##
	# Security is worthless without a modicum of usability. We're kind of stepping on other packagers' toes here, but... c'est la vie.
	# Remind me to submit a patch to https://aur.archlinux.org/packages/ezquake/ (and incorporate into ezquake-git, which I maintain).
	# Scratch that, ezquake uses "users" group. Works for me!
	chgrp -R users ${pkgdir}/opt/quake/
	chgrp users ${pkgdir}/usr/share/nquake

}
