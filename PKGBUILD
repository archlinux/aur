# Maintainer: detiam <dehe_tian <at> outlook <dot> com>
# Contributor: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-java-run
_pkgname=HMCL
_ver=3.5.5
_build=236
_pkgver=$_ver.$_build
_java_version=17
_jar_path="/usr/share/java/$pkgname.jar"
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that use aur/archlinux-java-run to select java version with javaFX (with aur/hmcl-new changes)'
arch=('any')
url='https://github.com/HMCL-dev/HMCL'
license=('GPL3')
depends=("java-runtime>=$_java_version" "java-openjfx>=$_java_version" 'hicolor-icon-theme' 'archlinux-java-run')
makedepends=("java-environment>=$_java_version" 'gradle')
provides=('hmcl')
conflicts=('hmcl')
source=("${_pkgname}-v${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz"
		"0001-Target-Java-$_java_version.patch"
		"0002-Cleanup.patch")
sha256sums=('c5bbb74809e1d66684f8370816b5e15dae149337eaadac0ae30f246ccfc80dd1'
            'c395ad622cf81a07d5738f6c20b845b51c900fd1aa0e9b87fd8ea415b8fac646'
            'f723aebb63bd414bdd86e41c9795686fa0b409ddb339b5bc953b3c9097a76b02')

prepare() {
	for patch in "${source[@]}"; do
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
		-D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

package() {
	install -Dm644 "$_pkgname-$_pkgver/HMCL/build/libs/$_pkgname-$pkgver.jar" "$pkgdir/$_jar_path"
	install -Dm644 "$_pkgname-$_pkgver/HMCL/image/hmcl.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
	install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 <(sed -e "s|%JAVA_VERSION%|$_java_version|g" -e "s|%JAR_PATH%|$_jar_path|g" <<- SCRIPT
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

		env GDK_CORE_DEVICE_EVENTS=1 archlinux-java-run -f 'javafx' -a '%JAVA_VERSION%' -- -jar '%JAR_PATH%' "\$args"

		SCRIPT
	) "$pkgdir/usr/bin/$pkgname"

	install -Dm755 <(sed \
		-e "s|%PROJECT_NAME_SHORT%|$_pkgname|g" \
		-e "s|%PROJECT_NAME%|$pkgname|g" \
		-e "s|%PROJECT_DESC%|$pkgdesc|g" \
		-e "s|%WM_CLASS%|org.jackhuang.hmcl.Launcher|g" <<- DESKTOP
			[Desktop Entry]
			Version=1.0
			Type=Application
			Name=%PROJECT_NAME_SHORT%
			Comment=%PROJECT_DESC%
			Exec=%PROJECT_NAME% --hmcl-global %U
			Icon=%PROJECT_NAME%
			Terminal=false
			StartupNotify=true
			Categories=Game;
			StartupWMClass=%WM_CLASS%

			DESKTOP
	) "$pkgdir/usr/share/applications/$pkgname.desktop"
}
