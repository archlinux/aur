# Maintainer: brent s. <bts[at]square-r00t[dot]net>

#TODO: set up permissions (e.g. fortress/{progs,sounds, etc.} to be sticky-bit and writable? that way maybe at least files can be downloaded. create maps dir for all mods too.
#TODO: change permissions for all .cfg's to 664?
#TODO: way to force mode/ownership of newly created files? umask per dir?

pkgname=('nquake-base' 'nquake-nonfree' 'nquake-fortress' 'nquake-arena' 'nquake-textures')
pkgbase="nquake"
pkgver=2.3
pkgrel=7
pkgdesc="The easiest, quickest, and most popular QuakeWorld client."
url="http://nquake.sourceforge.net/"
license=('GPL' 'Custom:CC0-1.0')
depends=('unzip' 'ezquake')
arch=('any')

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
	"CC0-1.0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt")

sha256sums=('fa4e166d06f6af88339448a4beaa9108418168493310242c457c644e7fc1ac00'
	    '207267e0202bc2ad9f45a34a02f4c353c1ece83c10572188781732eb184e448f'
	    '6ab154fdefca8bc7e080565ac61d74ccce7cf0599de1bb2f82cf32309d9cc767'
	    'a3df93400b03e44f6d87c1781f1205fc846d555945c43b81e5381b9df9b8da04'
	    '029ccc6764fc442a50b6ceac319377f61183060d67bde8f26137c4101862b09d'
	    '3e2c25baff6cdd58117b663fbd3d8570791e9dc777ebb28da8820f7934a6439d'
	    'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package_nquake-base () {

	pkgdesc="The easiest, quickest, and most popular QuakeWorld client. (nQuake core)"
	license=('GPL2')
	install=nquake-base.install
	optdepends=('nquake-nonfree: non-GPL assets- STRONGLY recommended'
		    'nquake-fortress: Team Fortress mod as distributed with nQuake'
		    'nquake-arena: Clan Arena as distributed with nQuake'
		    'nquake-textures: Hi-Res Textures as distributed with nQuake')

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

	# Security is worthless without a modicum of usability. We're kind of stepping on other packagers' toes here, but... c'est la vie.
	# Remind me to submit a patch to https://aur.archlinux.org/packages/ezquake/ (and incorporate into ezquake-git, which I maintain).
	# Scratch that, ezquake uses "users" group. Works for me!
	chgrp -R users ${pkgdir}/opt/quake/
	chgrp users ${pkgdir}/usr/share/nquake
	
}

package_nquake-nonfree () {

	pkgdesc="The easiest, quickest, and most popular QuakeWorld client. (Non-GPL assets)"
	license=('Custom:CC0-1.0') # a.k.a. "public domain". per empazar @ upstream nQuake, non-GPL sources obtained from Quake community in freely distributed (but unlicensed) works.
	install=nquake-generic.install
	depends=('nquake-base')
	optdepends=('nquake-fortress: Team Fortress mod as distributed with nQuake'
                    'nquake-arena: Clan Arena as distributed with nQuake'
                    'nquake-textures: Hi-Res Textures as distributed with nQuake')

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

}

package_nquake-fortress () {

	pkgdesc="The easiest, quickest, and most popular QuakeWorld client. (Team Fortress, nQuake distribution)"
	license=('Custom:CC0-1.0') # a.k.a. "public domain".
	install=nquake-generic.install
	depends=('nquake-base')
	optdepends=('nquake-nonfree: non-GPL assets- STRONGLY recommended'
                    'nquake-arena: Clan Arena as distributed with nQuake'
                    'nquake-textures: Hi-Res Textures as distributed with nQuake')

	# Most of these files are in addon-fortress.zip
	install -d -m 0750 ${pkgdir}/opt/quake/
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/fortress ${pkgdir}/opt/quake/.  # The entire mod

}

package_nquake-arena () {

	pkgdesc="The easiest, quickest, and most popular QuakeWorld client. (Clan Arena, nQuake distribution)"
	license=('Custom:CC0-1.0') # a.k.a. "public domain".
	install=nquake-generic.install
	depends=('nquake-base')
        optdepends=('nquake-nonfree: non-GPL assets- STRONGLY recommended'
                    'nquake-fortress: Team Fortress mod as distributed with nQuake'
                    'nquake-textures: Hi-Res Textures as distributed with nQuake')

	# Most of these files are in addon-clanarena.zip
	install -d -m 0750 ${pkgdir}/opt/quake/
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/arena ${pkgdir}/opt/quake/.  # The entire mod
	cp -a ${srcdir}/prox ${pkgdir}/opt/quake/.  # QuakeProxy, I think?

}

package_nquake-textures () {

# TODO: is aur/quake-qrp-textures more up-to-date than the QRP in the nQuake mirrors? If so, make that a dependency and symlink or copy.

	pkgdesc="The easiest, quickest, and most popular QuakeWorld client. (QRP Textures, nQuake distribution)"
	license=('Custom:CC0-1.0') # a.k.a. "public domain".
	install=nquake-generic.install
	depends=('nquake-base')
        optdepends=('nquake-nonfree: non-GPL assets- STRONGLY recommended'
                    'nquake-fortress: Team Fortress mod as distributed with nQuake'
                    'nquake-arena: Clan Arena as distributed with nQuake')

	# Most of these files are in addon-textures.zip
	install -d -m 0750 ${pkgdir}/opt/quake/qw
	install -d -m 0755 ${pkgdir}/usr/share/licenses/${pkgname}
	cp -a ${srcdir}/CC0-1.0 ${pkgdir}/usr/share/licenses/${pkgname}/.
	# And the Business-End(TM). Do the thing.
	cp -a ${srcdir}/qw/textures.pk3 ${pkgdir}/opt/quake/qw.  # Textures
	cp -a ${srcdir}/qw/readme-textures.txt ${pkgdir}/opt/quake/.  # ????

}
