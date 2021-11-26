# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.06
pkgrel=1
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=(uasm)
source=(https://7-zip.org/a/7z2106-src.7z)
sha256sums=('675eaa90de3c6a3cd69f567bba4faaea309199ca75a6ad12bac731dcdae717ac')

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
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 DOC/{copying,License,unRarLicense}.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 DOC/{7zC,7zFormat,lzma,Methods,readme,src-history}.txt
}

