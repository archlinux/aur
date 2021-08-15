# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.03
pkgrel=4
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=(uasm)
conflicts=(p7zip)
source=(https://7-zip.org/a/7z2103-src.7z)
sha256sums=('94a0c543092d50ca88b999c35027715181fcc9be40526ff363df6e38345222b3')

prepare() {
	sed -i 's|CFLAGS_WARN_WALL = -Wall -Werror -Wextra|CFLAGS_WARN_WALL = -Wall -Wextra|g' CPP/7zip/7zip_gcc.mak
	sed -i 's|MY_ASM = asmc|MY_ASM = uasm|g' CPP/7zip/7zip_gcc.mak
	sed -i '1iOPTION FRAMEPRESERVEFLAGS:ON\nOPTION PROLOGUE:NONE\nOPTION EPILOGUE:NONE' Asm/x86/LzFindOpt.asm
	sed -i 's|$(CXX) -o $(PROGPATH) -s $(MY_ARCH_2) $(LDFLAGS) $(LD_arch) $(OBJS) $(MY_LIBS) $(LIB2)|$(CXX) -o $(PROGPATH) -s $(MY_ARCH_2) $(LDFLAGS) -Wl,-z,noexecstack $(LD_arch) $(OBJS) $(MY_LIBS) $(LIB2)|g' CPP/7zip/7zip_gcc.mak
}

build() {
	cd CPP/7zip/Bundles/Alone2
	make -f ../../cmpl_gcc_x64.mak
}

package() {
	install -Dt "${pkgdir}"/usr/bin -m0755 CPP/7zip/Bundles/Alone2/b/g_x64/7zz
	ln -sf 7zz "${pkgdir}"/usr/bin/7z
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 DOC/{copying,License,unRarLicense}.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 DOC/{7zC,7zFormat,lzma,Methods,readme,src-history}.txt
}

