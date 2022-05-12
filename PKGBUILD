# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.07
pkgrel=2
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=(uasm)
source=(https://7-zip.org/a/7z2107-src.7z
		gcc-12.patch)
sha256sums=('d1074d56f415aab99d99e597a7b66dc455dba6349ae8a4c89df76475b6a1284c'
            'e4d34366e091b8404dd04f02bcad46518d2930ec0b4a420e1316db020234b085')

prepare() {
	sed -i 's|MY_ASM = asmc|MY_ASM = uasm|g' CPP/7zip/7zip_gcc.mak
	sed -i 's|LFLAGS_ALL = -s $(MY_ARCH_2) $(LDFLAGS) $(LD_arch) $(OBJS) $(MY_LIBS) $(LIB2)|LFLAGS_ALL = -s $(MY_ARCH_2) $(LDFLAGS) -Wl,-z,noexecstack $(LD_arch) $(OBJS) $(MY_LIBS) $(LIB2)|g' CPP/7zip/7zip_gcc.mak
	patch -Np1 -i ../gcc-12.patch
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

