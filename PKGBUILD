# Maintainer: Sid Pranjale <sidpranjale127@protonmail.com>

#TODO: set up permissions (e.g. fortress/{progs,sounds, etc.} to be sticky-bit and writable? that way maybe at least files can be downloaded. create maps dir for all mods too.
#TODO: change permissions for all .cfg's to 664?
#TODO: way to force mode/ownership of newly created files? umask per dir?
# NOTE: as of 2.3-8, with pacman 5 there is crippled support for split-package. so we build one friggin' huge thing.
# sorry, community- i do hope someday that pacman devs stop making arbitrary changes on a whim.

pkgname=('nquake')
pkgver=latest
pkgrel=14
pkgdesc="The easiest, quickest, and most popular QuakeWorld client."
url="http://nquake.com/"
license=('GPL2' 'custom')
depends=('unzip' 'ezquake')
optdepends=('nquakesv: the nquake server' 'quake-qrp-textures: high-res textures for quake')
arch=('any')
install=nquake.install

_alt_pkgver=$(echo ${pkgver} | sed -e 's/\.//g')

# http://nquake.sourceforge.net/nquake.ini for list of mirrors
#_nQ_MIRROR="http://qw.quakephil.com/nquake" # NY, US
#_nQ_MIRROR="http://quakeservers.nquake.com" # Dusseldorf, DE
#_nQ_MIRROR="http://nquake.localghost.net" # Lulea, SE
#_nQ_MIRROR="http://fnu.nquake.com" # Uppsala, SE

#nQuake moved their mirrors to GitHub, as the quakeservers link tells us, so that's what we'll use
_nQ_MIRROR="https://github.com/nQuake/distfiles/releases/download/snapshot"


source=("${_nQ_MIRROR}/gpl.zip"
	"${_nQ_MIRROR}/non-gpl.zip"
	"${_nQ_MIRROR}/linux.zip"
	"${_nQ_MIRROR}/addon-clanarena.zip"
	"${_nQ_MIRROR}/addon-fortress.zip"
	"${_nQ_MIRROR}/qsw106.zip"
	"CC0-1.0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")

noextract=('qsw106.zip')

sha512sums=('SKIP'  # gpl.zip
            'SKIP'  # non-gpl.zip
            'SKIP'  # linux.zip
            'SKIP'  # addon-clanarena.zip
            'SKIP'  # addon-fortress.zip
	    'SKIP'  # qsw106.zip
            '1eb4436f8d58766cbe99db97e5e8c0db8a706376afd291c337de1ba7a6b066d3791dc85ad034bdd54ea336bed6e6e8e7a037d8b04b2773c9c7517b9d9921d1fa'  # CC0-1.0
			)

prepare () {
	unzip -o -j "qsw106.zip" "ID1/PAK0.PAK"
	unzip -o -j "qsw106.zip" "LICINFO.TXT"
	unzip -o -j "qsw106.zip" "README.TXT"
	unzip -o -j "qsw106.zip" "SLICNSE.TXT"
}

package () {
## BASE ##
	install -d -m775 -g users /opt/quake
	# Most of these files are in gpl.zip
	install -d -m 0755 ${pkgdir}/opt/quake/{id1,qw,ezquake}
	install -d -m 0755 ${pkgdir}/usr/share/nquake
	install -d -m 0755 ${pkgdir}/usr/share/doc/nquake
	install -d -m 0755 ${pkgdir}/usr/share/licenses/nquake
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
	install -d -m 0755 ${pkgdir}/opt/quake/qw/{skins,matchinfo}
	install -d -m 0755 ${pkgdir}/usr/share/doc/nquake
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
	install -d -m 0755 ${pkgdir}/opt/quake/
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/fortress ${pkgdir}/opt/quake/.  # The entire mod

## ARENA ##	
	# Most of these files are in addon-clanarena.zip
	install -d -m 0755 ${pkgdir}/opt/quake/
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/arena ${pkgdir}/opt/quake/.  # The entire mod
	cp -a ${srcdir}/prox ${pkgdir}/opt/quake/.  # QuakeProxy, I think?
	
## TEXTURES ##
	# TODO: is aur/quake-qrp-textures more up-to-date than the QRP in the nQuake mirrors? If so, make that a dependency and symlink or copy.
	# Most of these files are in addon-textures.zip
	install -d -m 0755 ${pkgdir}/opt/quake/qw
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	ln -sf /opt/quake/id1/QRP_map_textures_v.1.00.pk3 ${pkgdir}/opt/quake/qw/QRP_map_textures_v.1.00.pk3
	ln -sf /opt/quake/id1/QRP_normalmap_textures_add-on_v.1.00.pk3 ${pkgdir}/opt/quake/qw/QRP_normalmap_textures_add-on_v.1.00.pk3
}
