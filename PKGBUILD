# Maintainer: detiam <dehe_tian <at> outlook <dot> com>
# Contributor: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-java-run
_pkgname=HMCL
_ver=3.6
_build=20
_pkgver=release-$_ver.$_build
_java_version=21
_jar_path="/usr/share/java/$pkgname.jar"
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that use aur/archlinux-java-run to select java version with javaFX (with aur/hmcl-new changes)'
arch=('any')
url='https://github.com/HMCL-dev/HMCL'
license=('GPL3')
depends=("java-runtime>=$_java_version" 'hicolor-icon-theme' 'archlinux-java-run')
makedepends=("java-environment>=$_java_version" 'gradle')
optdepends=("java-openjfx>=$_java_version: Require a Java version that support openjfx")
provides=('hmcl')
conflicts=('hmcl')
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
		"0001-Target-Java-21.patch::https://aur.archlinux.org/cgit/aur.git/plain/0001-Target-Java-21.patch?h=hmcl-new&id=7360c04f6630aba6699fcc904946722e785f3520"
		"0002-Cleanup.patch::https://aur.archlinux.org/cgit/aur.git/plain/0002-Cleanup.patch?h=hmcl-new&id=7360c04f6630aba6699fcc904946722e785f3520")
sha256sums=('1b1ca436bb027e712eaca15f93468d992535f61d1cc25743dedd4369e573aa1e'
            'c41660be2585c6feae10e6edd40d1c9cddffe8dae99b784f54624b5bbdf6208f'
            '1a75f0f5aaa498287c44bc6232a96c2c95f5daccbafb2456a001f8c7dacb9c66')

prepare() {
	for patch in "${source[@]%%::*}"; do
		if [[ $patch == *.patch ]]; then
			msg2 "applying $patch"
			patch -d "$_pkgname-$_pkgver" -Np1 < "$patch"
		fi
	done
}

build() {
	cd "$_pkgname-$_pkgver"
	# shellcheck disable=SC2016
	VERSION_TYPE=stable \
		VERSION_ROOT="$_ver" BUILD_NUMBER="$_build" \
		MICROSOFT_AUTH_ID='6a3728d6-27a3-4180-99bb-479895b8f88e' MICROSOFT_AUTH_SECRET='dR.50SWwVez4-PQOF2-e_2GHmC~4Xl-p4p' \
		CURSEFORGE_API_KEY='$2a$10$o8pygPrhvKBHuuh5imL2W.LCNFhB15zBYAExXx/TqTx/Zp5px2lxu' \
		gradle build -x test --no-daemon \
			-D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

check() {
	cd "$_pkgname-$_pkgver"
	gradle test --no-daemon \
		-D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m' || true
}

package() {
	install -Dm644 "$_pkgname-$_pkgver/HMCL/build/libs/$_pkgname-$pkgver.jar" "$pkgdir/$_jar_path"
	install -Dm644 "$_pkgname-$_pkgver/HMCL/image/hmcl.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
	install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 <(cat <<- SCRIPT
		#!/usr/bin/env sh
		set -eu

		print_usage() {
		  cat <<- EOF
			usage: \$(basename "\$0") [-h/-p] [args passed to java]

			Options:
			  -h  --help:
			    Print this message
			  --hmcl-global:
			    Use "\${XDG_DATA_HOME:-\$HOME/.local/share}/hmcl" as working directory
			EOF
		  exit 0
		}

		args=''
		for arg in "\$@" ; do
		  case "\$arg" in
		  -h|--help)
		    print_usage
		    ;;
		  --hmcl-global)
		    printf 'Global mode\n\n'
		    WORKDIR=\${XDG_DATA_HOME:-\$HOME/.local/share}/hmcl
		    mkdir -p "\$WORKDIR"
		    cd "\$WORKDIR" || exit 2
		    ;;
		  *)
		    args="\$args \$arg"
		    ;;
		  esac
		done

		env GDK_CORE_DEVICE_EVENTS=1 archlinux-java-run -f 'javafx' -a '$_java_version' -- -jar '$_jar_path' "\$args"

		SCRIPT
	) "$pkgdir/usr/bin/$pkgname"

	install -Dm755 <(cat <<- DESKTOP
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=$_pkgname
		Comment=$pkgdesc
		Exec=$pkgname --hmcl-global %U
		Icon=$pkgname
		Terminal=false
		StartupNotify=true
		Categories=Game;
		StartupWMClass=org.jackhuang.hmcl.Launcher

		DESKTOP
	) "$pkgdir/usr/share/applications/$pkgname.desktop"
}
