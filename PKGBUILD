pkgname="wolframengine"
pkgver="12.2.0"
pkgrel="0"
pkgdesc="Free Wolfram Engine(TM) for Developers"
arch=("x86_64")
provides=("wolframscript")
license=("custom")
source=("https://files.wolframcdn.com/WolframEngine/${pkgver}.${pkgrel}/WolframEngine_${pkgver}_LIN.sh")
noextract=("WolframEngine_${pkgver}_LIN.sh")
sha256sums=("a9e1cf60a1920f98d8e80c09356146444f4d454d2e7811b8fc55363600593dcb")

package() {
	cd "${srcdir}"

	# As of writing the PKGBUILD (12.2.0), the following additional files are created by the official installer:
	# - .CreationID
	# - .Revision
	# - .VersionID
	# - SystemFiles/Installtion/wolfram-mathematica12.desktop (dynamically generated, contains $pkgdir)
	# - (sometimes) InstallErrors
	# These files seem to be used by the installer to detect the version of an older installation.
	# For the sake of convenience we omit them here.
	# The WolframEngine installer uses Makeself, whose version unfortunately does not support the --noexec option.
	# So we have to hard code the number of lines (388) here and extract the data manually.

	INSTDIR="/usr/lib/Wolfram/WolframEngine/12.2"
	EXTDIR="${pkgdir}$INSTDIR"
	tail +388 "WolframEngine_${pkgver}_LIN.sh" | tar xf -
	mkdir -p "$EXTDIR"
	tar xf "Unix/Files/Layout.M-LINUX-WolframEngine/contents.tar.xz" -C "$EXTDIR"
	install -Dm 0644 "$EXTDIR/LICENSE.txt" -t "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt

	# Install binaries
	ln -s "$INSTDIR/Executables/WolframKernel" "${pkgdir}"/usr/bin/WolframKernel

	# Install wolframscript included in Wolfram Engine
	bsdtar -x -f "$INSTDIR"/SystemFiles/Installation/wolframscript-*.rpm
	install -Dm 0755 opt/Wolfram/WolframScript/bin/wolframscript -t "${pkgdir}"/usr/bin/
	install -D opt/Wolfram/WolframScript/man/man1/wolframscript.1 -t "${pkgdir}"/usr/share/man/man1
	cp -r usr/share/* "${pkgdir}"/usr/share/
}
