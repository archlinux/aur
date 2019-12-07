# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

#TODO: set up permissions (e.g. fortress/{progs,sounds, etc.} to be sticky-bit and writable? that way maybe at least files can be downloaded. create maps dir for all mods too.
#TODO: change permissions for all .cfg's to 664?
#TODO: way to force mode/ownership of newly created files? umask per dir?
# NOTE: as of 2.3-8, with pacman 5 there is crippled support for split-package. so we build one friggin' huge thing.
# sorry, community- i do hope someday that pacman devs stop making arbitrary changes on a whim.

pkgname=('nquake')
pkgver=2.5
pkgrel=10
pkgdesc="The easiest, quickest, and most popular QuakeWorld client."
url="http://nquake.com/"
license=('GPL2' 'custom')
depends=('unzip' 'ezquake')
optdepends=('nquakesv: the nquake server')
arch=('any')
install=nquake.install

_alt_pkgver=$(echo ${pkgver} | sed -e 's/\.//g')

# http://nquake.sourceforge.net/nquake.ini for list of mirrors
#_nQ_MIRROR="http://qw.quakephil.com/nquake" # NY, US
_nQ_MIRROR="http://quakeservers.nquake.com" # Dusseldorf, DE
#_nQ_MIRROR="http://nquake.localghost.net" # Lulea, SE
#_nQ_MIRROR="http://fnu.nquake.com" # Uppsala, SE

source=("${_nQ_MIRROR}/gpl.zip"
	"${_nQ_MIRROR}/non-gpl.zip"
	"${_nQ_MIRROR}/linux.zip"
	"${_nQ_MIRROR}/addon-textures.zip"
	"${_nQ_MIRROR}/addon-clanarena.zip"
	"${_nQ_MIRROR}/addon-fortress.zip"
	"${_nQ_MIRROR}/qsw106.zip"
	"CC0-1.0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
	"gpl.zip.sig"
	"non-gpl.zip.sig"
	"linux.zip.sig"
	"addon-textures.zip.sig"
	"addon-clanarena.zip.sig"
	"addon-fortress.zip.sig"
	"CC0-1.0.sig"
	"qsw106.zip.sig")

noextract=('qsw106.zip')

sha512sums=('53367d70726c7d72db3522ab6a435192ddc05ae2f9760ea511d986213ef5a463a6f4a688e6d4dcb6a6858735f9c1690653a061cf94a34150dd12af5179b35782'  # gpl.zip
            'c3320070dd7de396b9e82afc7a9f53b16a85fab5cc77cb7213ea4fbc7b97653aa0526754f97caba32e3f8f7b90379815b7e6ec8ab9a4e9aab9ca789080892a88'  # non-gpl.zip
            '3aa75bf1c4b597622e84ff95d0f2fd70fe6676d598ec4d5c1c9fc8f1b5f65f8f0c18f34f33362b4668648e52ec9b2eb0f6c03095c83a0f39238e3818a7853a43'  # linux.zip
            '693379acc3c0204b810ab31aeaaedbb6d8659fd2140e3874f463bde3af5009a161d76b1dbd2f970e151ebae1f323848a937b8209cf2172c6251578edcad1753b'  # addon-textures.zip
            '0e6689ccb2c4c181da268b7728a73ee718eabaae463a4f97174dcaf41388464ae8cdb8d719e263d0d2cc4b4a975105950bae852074adb97914bdd1e3bad3e85e'  # addon-clanarena.zip
            'a15cbd4ccf2a3d87e0ec9f6f6f4546e2a68a0f03a516bac47d0965bc6affaf902669db0824619634dc19698698d40ef72325da33ea2c78437c45bd19bd2c8138'  # addon-fortress.zip
	    '32df717a4a8f121358243333c30d8d0e5d43ee04f3ee8175a894199b8932e90ebedc6b687c25207c6191dbf25363307f09f8c1dc767b58e254e015c150217384'  # qsw106.zip
            '1eb4436f8d58766cbe99db97e5e8c0db8a706376afd291c337de1ba7a6b066d3791dc85ad034bdd54ea336bed6e6e8e7a037d8b04b2773c9c7517b9d9921d1fa'  # CC0-1.0
            'SKIP'  # Sigs...
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP')

prepare () {
	unzip -o -j "qsw106.zip" "ID1/PAK0.PAK"
	unzip -o -j "qsw106.zip" "LICINFO.TXT"
	unzip -o -j "qsw106.zip" "README.TXT"
	unzip -o -j "qsw106.zip" "SLICNSE.TXT"
}

package () {
## BASE ##
	# Most of these files are in gpl.zip
	install -d -m 0750 ${pkgdir}/opt/quake/{id1,qw,ezquake}
	install -d -m 0750 ${pkgdir}/usr/share/nquake
	install -d -m 0750 ${pkgdir}/usr/share/doc/nquake
	install -d -m 0750 ${pkgdir}/usr/share/licenses/nquake
	install -d -m 0755 ${pkgdir}/usr/bin
	# Fix ezquake packages.
	install -d -m 0770 ${pkgdir}/opt/quake/ezquake/{sb/cache,temp}
	# Implement the following in ezQuake
	#chgrp games ${pkgdir}/usr/bin/ezquake
	#chmod 0750 ${pkgdir}/usr/bin/ezquake

	# These are provided by ezQuake.
	for i in player_{base,blue,cyan,green,orange,pink,purple,red,white,yellow}.png;
        do
           rm -f ${srcdir}/qw/skins/${i}
        done

	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/id1/gpl_maps.pk3 ${pkgdir}/usr/share/nquake/.  # handy to have lying around if you don't have the retail pak*.pak files
	cp -a ${srcdir}/qw/frogbot.pk3 ${pkgdir}/opt/quake/qw/.  # FrogBot, bots/AI
	cp -a ${srcdir}/ezquake/ezquake.pk3 ${pkgdir}/opt/quake/ezquake/nquake_ezquake.pk3  # we rename to avoid conflicts in the future
	cp -a ${srcdir}/ezquake/configs ${pkgdir}/opt/quake/ezquake/.  # actually part of the linux.zip, not gpl.zip

	ln -sf /usr/bin/ezquake ${pkgdir}/usr/bin/nquake

## DEMO DATA ##
	install -D -m 0644 ${srcdir}/PAK0.PAK ${pkgdir}/opt/quake/id1/pak0.pak
	install -D -m 0644 ${srcdir}/LICINFO.TXT ${pkgdir}/usr/share/doc/nquake/quake_shareware_license_info.txt
	install -D -m 0644 ${srcdir}/README.TXT ${pkgdir}/usr/share/doc/nquake/quake_shareware_readme.txt
	install -D -m 0644 ${srcdir}/SLICNSE.TXT ${pkgdir}/usr/share/licenses/nquake/quake_shareware.txt

## NON-FREE ##
	# Most of these files are in non-gpl.zip
	install -d -m 0750 ${pkgdir}/opt/quake/qw/{skins,matchinfo}
	install -d -m 0750 ${pkgdir}/usr/share/doc/nquake
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/qw/matchinfo ${pkgdir}/opt/quake/qw/.  # Demos
	cp -a ${srcdir}/qw/models.pk3 ${pkgdir}/opt/quake/qw/.  # Models
	cp -a ${srcdir}/qw/nquake.pk3 ${pkgdir}/opt/quake/qw/.  # nQuake tweaks
	cp -a ${srcdir}/readme.txt ${pkgdir}/usr/share/doc/nquake/.  # nQuake FAQ, credits, etc.
	cp -a ${srcdir}/qw/readme.txt ${pkgdir}/opt/quake/qw/.  # Directory structure schema
	cp -a ${srcdir}/qw/skins ${pkgdir}/opt/quake/qw/.  # Skins for models


	# Security is worthless without a modicum of usability. We're kind of stepping on other packagers' toes here, but... c'est la vie.
	# Remind me to submit a patch to https://aur.archlinux.org/packages/ezquake/ (and incorporate into ezquake-git, which I maintain).
	# Scratch that, ezquake uses "users" group. Works for me!
	chgrp -R users ${pkgdir}/opt/quake/
	chgrp users ${pkgdir}/usr/share/nquake

## FORTRESS ##
	# Most of these files are in addon-fortress.zip
	install -d -m 0750 ${pkgdir}/opt/quake/
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/fortress ${pkgdir}/opt/quake/.  # The entire mod

## ARENA ##	
	# Most of these files are in addon-clanarena.zip
	install -d -m 0750 ${pkgdir}/opt/quake/
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/arena ${pkgdir}/opt/quake/.  # The entire mod
	cp -a ${srcdir}/prox ${pkgdir}/opt/quake/.  # QuakeProxy, I think?
	
## TEXTURES ##
	# TODO: is aur/quake-qrp-textures more up-to-date than the QRP in the nQuake mirrors? If so, make that a dependency and symlink or copy.
	# Most of these files are in addon-textures.zip
	install -d -m 0750 ${pkgdir}/opt/quake/qw
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/qw/textures.pk3 ${pkgdir}/opt/quake/qw/.  # Textures
	cp -a ${srcdir}/qw/readme-textures.txt ${pkgdir}/opt/quake/.  # ????
}
