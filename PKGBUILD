# Maintainer: Andrew Munkres <amunkres@nyx.net>

pkgname=quickviewer
pkgver=1.1.3
pkgrel=1
pkgdesc="An image/comic viewer application"
arch=('i686' 'x86_64')
url="https://kanryu.github.io/quickviewer/"
license=('GPL3' 'custom:unrar' 'custom:ResizeHalf')
# Warning: QuickViewer's Git repository imports (as submodules) the source code
# of some required 3rd-party libraries into QuickViewer's own source tree as
# Git submodules; and while some of these (such as expat and easyexif) use
# GPL3-compatible licenses, at least one (unrar) uses a GPL3-incompatible
# license, while one other (ResizeHalf) does not appear to have any license
# terms whatsoever. Therefore, the compiled binary likely is not legally
# redistributable.
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
source=("${pkgname}::git://github.com/kanryu/${pkgname}.git#tag=v${pkgver}"
        "ResizeHalf::git://github.com/chikuzen/ResizeHalf.git#commit=5099b0dc6081ddb79c1a39694b223c5840c7da9b"
        "easyexif::git://github.com/mayanklahiri/easyexif.git#commit=19d15151c3f663813dc70cf9ff568d25ab6ff93b"
        "exiv2::git://github.com/Exiv2/exiv2.git#commit=fa449a4d2c58d63f0d75ff259f25683a98a44630"
        "libexpat::git://github.com/libexpat/libexpat.git#commit=56b64ca0406d31f0a8cd93e155c38a3b30b002f8"
        "luminor::git://github.com/kanryu/luminor.git#commit=c2d113b8a45f3c7118ded920277ca35583689d1c"
        "quazip::git://github.com/kanryu/quazip.git#commit=6cc7516f65f20e59739c629fe95a0eac7953260e"
        "zimg::git://github.com/sekrit-twc/zimg.git#commit=5e603b6390f0fc1e32e634dece083dd8b729334a"
        "zlib::git://github.com/madler/zlib.git#commit=cacf7f1d4e3d44d871b605da3b647f07d718623f"
        "qactionmanager::git://github.com/kanryu/qactionmanager.git#commit=2f66c030ef2169eccc240b10a10b7f921bd0cfea"
        "qfullscreenframe::git://github.com/kanryu/qfullscreenframe.git#commit=550f001f4383edaf5baf1598ad1473bc698f807a"
        "qlanguageselector::git://github.com/kanryu/qlanguageselector.git#commit=d0e5cb6141854c1eacb68d2dd31bf7cb9337a7ab"
        "qnamedpipe::git://github.com/kanryu/qnamedpipe.git#commit=f887aadb1b1587c82459e94ef3195c97a697ad05"
        "quickviewer-1.1.3-fix-nonwindows-filename-comparator.patch"
        "quickviewer-1.1.3-change-qmake-variable-defs.patch"
        "quickviewer-1.1.3-main-projectfile-changes.patch"
        "quickviewer-1.1.3-fileloader-projectfile-changes.patch"
        "quickviewer-1.1.3-lib7z-projectfile-changes.patch"
        "quickviewer-1.1.3-desktopfile-changes.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8a2729a3bd5b6b8a5e9124593c881b98a20db7742b66d82641a40ee256faaeb4'
            '17aaffcb0a8d812ac10d26b69b88163031e25b8144b5eb1ec65be96e33debace'
            'a5acde9f0b45819a472d3024bf12df524bc4e3dbd08cf4af2984f272c6c8a0da'
            '735373799b838a84c9f962a8319d58f104daeb7617d4da1e89ebd9dfb4e0ab95'
            '18b03a7f06d9cd4d5afbdc14f48caad5f065b212281984726e1c90bd48dbe5bd'
            '7c73402e349afe235b1ddcc81f33f0d8272e9271a37cc583c30d71ceb09abe11')

prepare() {
    cd ${pkgname}
    # Apply patch to fix non-Windows version of fileNameDescendingLessThan function:
    patch -Np1 -i ../quickviewer-1.1.3-fix-nonwindows-filename-comparator.patch
    # Apply patch to not build an AppImage, enable OpenGL, and adjust target pathname-prefix:
    patch -Np1 -i ../quickviewer-1.1.3-change-qmake-variable-defs.patch
    # Apply patch to install desktop and icon files, and change pathname for translations, etc.:
    patch -Np1 -i ../quickviewer-1.1.3-main-projectfile-changes.patch
    # Apply patches to have libraries build using qmake installed by their own qmake-projects,
    # and remove unwanted RPATH:
    patch -Np1 -i ../quickviewer-1.1.3-fileloader-projectfile-changes.patch
    patch -Np1 -i ../quickviewer-1.1.3-lib7z-projectfile-changes.patch
    # Apply patch to fix the pathname in QuickViewer.desktop:
    patch -Np1 -i ../quickviewer-1.1.3-desktopfile-changes.patch
    # Checkout the Git submodules:
    git submodule init ResizeHalf/ResizeHalf easyexif/easyexif exiv2/exiv2 libexpat/libexpat \
    luminor/luminor quazip/quazip zimg/zimg zlib/zlib QuickViewer/src/qactionmanager \
    QuickViewer/src/qfullscreenframe QuickViewer/src/qlanguageselector QuickViewer/src/qnamedpipe
    git config submodule.ResizeHalf.url ${srcdir}/ResizeHalf
    git config submodule.easyexif.url ${srcdir}/easyexif
    git config submodule.exiv2.url ${srcdir}/exiv2
    git config submodule.libexpat.url ${srcdir}/libexpat
    git config submodule.luminor.url ${srcdir}/luminor
    git config submodule.quazip.url ${srcdir}/quazip
    git config submodule.zimg.url ${srcdir}/zimg
    git config submodule.zlib.url ${srcdir}/zlib
    git config submodule.qactionmanager.url ${srcdir}/qactionmanager
    git config submodule.qfullscreenframe.url ${srcdir}/qfullscreenframe
    git config submodule.qlanguageselector.url ${srcdir}/qlanguageselector
    git config submodule.qnamedpipe.url ${srcdir}/qnamedpipe
    git submodule update
}

build() {
    cd ${pkgname}
    qmake -o Makefile -recursive QVproject.pro
    make
    lrelease QuickViewer/translations/*.ts
}

package() {
    cd ${pkgname}
    make INSTALL_ROOT="${pkgdir}" install
}
