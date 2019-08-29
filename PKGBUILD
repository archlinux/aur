# Maintainer: Tyler Holinka <TylerHolinka+aur at gmail dot com>
# based off the runelite-git package
# note: runeliteplus doesn't currently do releases on github
# so there is no real way to grab the current actual version.
# We could grab it out of build.gradle, but we don't have access
# to that until build time
pkgname=runeliteplus-git
# the git repo name
_pkgname=runelite
pkgdesc="Open source Old School RuneScape client.  (from git master branch)"
pkgver=3270+gcbc07f18c
pkgrel=1
arch=(any)
license=('BSD')
url="https://github.com/runelite-extended/runelite"
provides=("runeliteplus")

# currently fails to compile anything other than jdk8
_JAVA_VERSION='8'
_JAVA_HOME="/usr/lib/jvm/java-${_JAVA_VERSION}-openjdk"

depends=("java-runtime=${_JAVA_VERSION}" 'ttf-font')
optdepends=('gvfs: enable links')
makedepends=('gradle' "java-environment=${_JAVA_VERSION}" "java${_JAVA_VERSION}-openjfx")

source=("git+${url}.git"
		'runeliteplus.desktop'
		# we grab the image from the website's assets/icons directory
		# since that's the highest quality version
		'runeliteplus.png::https://rawcdn.githack.com/runelite-extended/runelitepl.us/7949832e9c2ef6d4e4a225950132c20e54f58336/src/assets/icons/icon-512x512.png')
sha512sums=('SKIP'
			'ced8abfcd9f73e0636139a832cc1b7b93e63937f10ad6fd4cc3439abe68e174501e3503aa7b239e4672386a9f1893305fc6bc2b617290e61b687018099536385'
			'd4afe6d853a1cacd50ea62fc06a05e3659a367a156287e52599af7ff5020427335ae3d83b8a7b170d9af645f6951dce47d5acd1d88d1f440652731becda661fe')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	# this is how to get the actual version
	# sadly we don't have access to the git repo yet, as it's just been bare-cloned
	#export pkgver=$(grep "version = '" build.gradle | awk '{print $3}' | sed "s/'//g")

	git describe --tags | sed 's/-/+/g' | cut -d '+' -f 3-5
}


build() {
	cd ${srcdir}/${_pkgname}

	# force java 8 to be used
	export JAVA_HOME="$_JAVA_HOME"
	echo "org.gradle.java.home=$_JAVA_HOME" >> gradle.properties

	# we use system gradle instead of gradlew, which would download gradle instead
	# also we do --no-daemon so that we don't leave a daemon process hanging around
    # also don't run tests, they're broken a lot
	gradle build --no-daemon -x test -x:client:checkstyleMain -x:runelite-api:checkstyleMain
}

package() {
	client_jar=$(find ${srcdir}/${_pkgname}/runelite-client/build/libs -type f -name client-*-shaded.jar)

	# actual client jar
	install -D -m644 \
		"${client_jar}" \
		"${pkgdir}/usr/share/runeliteplus/RuneLite.jar"

	# desktop file
	install -D -m644 \
		"${srcdir}/runeliteplus.desktop" \
		"${pkgdir}/usr/share/applications/runeliteplus.desktop"

	# icon
	install -D -m644 \
		"${srcdir}/runeliteplus.png" \
		"${pkgdir}/usr/share/pixmaps/runeliteplus.png"

	# license
	install -D -m644 \
		"${srcdir}/${_pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}"

	# script to start up jar
	exec_path="${pkgdir}/usr/bin/runeliteplus"
	install -D -m755 \
		"/dev/null" \
		"$exec_path"

	echo '#!/bin/sh' > "$exec_path"

	# jre8-openjdk is packaged in java-8-openjdk/jre, instead of just java-8-openjdk like the other openjdk versions
	java="$JAVA_HOME/jre/bin/java"

	# jagex pollutes ~/ with a few non-dot files (jagexcache, jagex_cl_oldschool_LIVE.dat, etc),
	# so we'll move it to its own folder (~/.runescape) (note: this is resolved at run time)
	rs='$HOME/.runescape'

	# we'll also link ~/.runescape/.cache and ~/.runescape/.java
	# so that the user can manage those together with their other .cache / .java stuff
	# note that we aren't linking .runelite, that way all runelite-specific stuff is in ~/.runescape
	echo "# see PKGBUILD for why we're doing these links" >> "$exec_path"
	echo "mkdir -p $rs" >> "$exec_path"
	echo "test -d $rs/.cache || ln -s \$HOME/.cache $rs/.cache" >> "$exec_path"
	echo "test -d $rs/.java || ln -s \$HOME/.java $rs/.java" >> "$exec_path"
	echo >> "$exec_path"

	# all the options
	opts="-Dhttps.protocols=TLSv1.2 -Duser.home=$rs"

	echo "exec $java $opts -jar /usr/share/runeliteplus/RuneLite.jar \$@" >> "$exec_path"
}

