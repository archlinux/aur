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
pkgver=2.3
pkgrel=10
pkgdesc="The easiest, quickest, and most popular QuakeWorld client."
url="http://nquake.sourceforge.net/"
license=('GPL2' 'Custom:CC0-1.0' '')
depends=('unzip' 'ezquake')
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
	"CC0-1.0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
	"gpl.zip.sig"
	"non-gpl.zip.sig"
	"linux.zip.sig"
	"addon-textures.zip.sig"
	"addon-clanarena.zip.sig"
	"addon-fortress.zip.sig"
	"CC0-1.0.sig")

sha512sums=('0a5cd2e2816d535c66b156072f52c4e5bcb6c1b4664d8f0481dce5cf68d3cd69ba24afaf839009a3a95c87812314a9816719c4fbc56ba89baf80676b0432571f'
            'b615d791a140631b163d71061aa48e2fd5e9b1fae88335e2a0972eb232d8c7d5a31fc16a137df75c6ce0284cb140bf56c0b52f2f56ecec78b288424c698e186c'
            '583704a192eab419da46efd0ac3b98c1ca8d9a6ff785186558929207b517a0cf779b593075d6187ab3cd7bb08711a85fe73436f76fbcd99917a5511aa369a83a'
            '693379acc3c0204b810ab31aeaaedbb6d8659fd2140e3874f463bde3af5009a161d76b1dbd2f970e151ebae1f323848a937b8209cf2172c6251578edcad1753b'
            '96dca06af3f1044816247596c75876fabb5a7d9585229f43e85552872ef5b4c754a830fd7f83d6107c0e3df62951ee952bb36b5a184b74a8b1870125c3d23dad'
            'a15cbd4ccf2a3d87e0ec9f6f6f4546e2a68a0f03a516bac47d0965bc6affaf902669db0824619634dc19698698d40ef72325da33ea2c78437c45bd19bd2c8138'
            '1eb4436f8d58766cbe99db97e5e8c0db8a706376afd291c337de1ba7a6b066d3791dc85ad034bdd54ea336bed6e6e8e7a037d8b04b2773c9c7517b9d9921d1fa'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package () {
## BASE ##
	# Most of these files are in gpl.zip
	install -d -m 0750 ${pkgdir}/opt/quake/{id1,qw,ezquake}
	install -d -m 0750 ${pkgdir}/usr/share/nquake
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
	cp -a ${srcdir}/qw/textures.pk3 ${pkgdir}/opt/quake/qw.  # Textures
	cp -a ${srcdir}/qw/readme-textures.txt ${pkgdir}/opt/quake/.  # ????
}
