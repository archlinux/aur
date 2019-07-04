# Maintainer: Yadav Gowda <thylacine222@gmail.com>

pkgname=zotero-esr-git
pkgver=r10433.2186e939a
pkgrel=2
pkgdesc='Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources. This version relies on an existing installation of Firefox ESR52. Also compiles custom poppler utils from source.'
arch=('x86_64' 'aarch64')
url='http://www.zotero.org'
license=('GPL3')
depends=('firefox-esr52')
makedepends=('cmake' 'npm' 'python' 'rsync' 'zip')
conflicts=('zotero')
replaces=('zotero')
_src_dir_1=zotero-client
_src_dir_2=zotero-build
_src_dir_3=zotero-standalone-build
_src_dir_4=zotero-poppler
source=(
    "${_src_dir_1}::git+https://github.com/zotero/zotero"
    "${_src_dir_2}::git+https://github.com/zotero/zotero-build"
    "${_src_dir_3}::git+https://github.com/zotero/zotero-standalone-build"
    "${_src_dir_4}::git+https://github.com/zotero/cross-poppler"
    "https://poppler.freedesktop.org/poppler-0.62.0.tar.xz"
    "https://poppler.freedesktop.org/poppler-data-0.4.8.tar.gz"
    "zotero")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 
            '5b9a73dfd4d6f61d165ada1e4f0abd2d420494bf9d0b1c15d0db3f7b83a729c6' 
            '1096a18161f263cccdc6d8a2eb5548c41ff8fcf9a3609243f1b6296abdf72872'
            '798952995c2b7fad20f654920cae8a3def490220ba5298209250f9426fc8565c')

pkgver() {
    cd ${_src_dir_1}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_src_dir_1}
    git submodule init && git submodule update
    cd ../${_src_dir_2}
    git submodule init && git submodule update
    cd ../${_src_dir_3}
    git submodule init && git submodule update
}

build() {
    # build zotero client
    cd ${_src_dir_1}
    npm i
    npm run build
    local hash=`git rev-parse --short HEAD`

    cd ../

    #build custom poppler utils 
    cd poppler-0.62.0
    sed -i '3 s/^/#/' CMakeLists.txt
    sed -i '16 s/^/#/' CMakeLists.txt
    sed -i '17 s/^/#/' CMakeLists.txt
    sed -i '492 s/^/#/' CMakeLists.txt
    sed -i '98,104 s/^/#/' CMakeLists.txt
    sed -i '119 s/^/#/' CMakeLists.txt
    sed -i '121 s/^/#/' CMakeLists.txt
    sed -i "/Win32Console win32console(&argc, &argv);/a if(argc!=3 || argv[1][0]=='-' || argv[2][0]=='-') {fprintf(stderr,\"This is a custom Poppler pdfinfo build. Please use the original version!\\\\n%s\\\\n%s\\\\n%s\\\\npdfinfo <PDF-file> <output-file>\\\\n\",PACKAGE_VERSION,popplerCopyright,xpdfCopyright); return 1;} else {freopen( argv[argc-1], \"w\", stdout); argc--;}" utils/pdfinfo.cc
    sed -i '5871 s/^/\/\//' poppler/TextOutputDev.cc

    cd ../
    
    cp ${_src_dir_4}/pdftotext.cc poppler-0.62.0/utils/pdftotext.cc

    export COMMON_OPTIONS="-DCMAKE_BUILD_TYPE=release \
		-DBUILD_SHARED_LIBS=OFF \
		-DBUILD_GTK_TESTS=OFF \
		-DBUILD_QT4_TESTS=OFF \
		-DBUILD_QT5_TESTS=OFF \
		-DBUILD_CPP_TESTS=OFF \
		-DENABLE_SPLASH=OFF \
		-DENABLE_CPP=OFF \
		-DENABLE_GLIB=OFF \
		-DENABLE_GTK_DOC=OFF \
		-DENABLE_QT4=OFF \
		-DENABLE_QT5=OFF \
		-DENABLE_LIBOPENJPEG=unmaintained \
		-DENABLE_CMS=none \
		-DENABLE_LIBCURL=OFF \
		-DENABLE_ZLIB=OFF \
		-DENABLE_DCTDECODER=unmaintained \
		-DENABLE_ZLIB_UNCOMPRESS=OFF \
		-DSPLASH_CMYK=OFF \
		-DWITH_JPEG=OFF \
		-DWITH_PNG=OFF \
		-DWITH_TIFF=OFF \
		-DWITH_NSS3=OFF \
		-DWITH_Cairo=OFF \
		-DWITH_FONTCONFIGURATION_FONTCONFIG=OFF"

    cd poppler-0.62.0/  
    cmake ./ -DCMAKE_CXX_FLAGS="-std=c++11 -Os" \
			 -DCMAKE_EXE_LINKER_FLAGS="-static -pthread" \
			 ${COMMON_OPTIONS}
    make

    cd ../

    # copy poppler data
    mkdir ${_src_dir_1}/build/poppler-data

    cp -r poppler-data-0.4.8/cidToUnicode ${_src_dir_1}/build/poppler-data/
    cp -r poppler-data-0.4.8/cMap ${_src_dir_1}/build/poppler-data/
    cp -r poppler-data-0.4.8/nameToUnicode ${_src_dir_1}/build/poppler-data/
    cp -r poppler-data-0.4.8/unicodeMap ${_src_dir_1}/build/poppler-data/
    cp poppler-data-0.4.8/COPYING ${_src_dir_1}/build/poppler-data/
    cp poppler-data-0.4.8/COPYING.adobe ${_src_dir_1}/build/poppler-data/
    cp poppler-data-0.4.8/COPYING.gpl2 ${_src_dir_1}/build/poppler-data/

    # copy custom poppler execs
    cp poppler-0.62.0/utils/pdftotext poppler-0.62.0/utils/pdfinfo "${_src_dir_1}/build/"

    # build xpi
    ./${_src_dir_2}/xpi/build_xpi -s "${_src_dir_1}/build" -c source -m $hash 

    mkdir ${_src_dir_2}/zotero
    rsync -a "${_src_dir_2}/xpi/build/staging/" "${_src_dir_2}/zotero/"

    rm ${_src_dir_2}/zotero/install.rdf

    # Delete Mozilla signing info if present
    rm -rf ${_src_dir_2}/zotero/META-INF

    # Copy branding
    cp -R "${_src_dir_3}/assets/branding" "${_src_dir_2}/zotero/chrome/branding"

    # Add to chrome manifest
    echo "" >> "${_src_dir_2}/zotero/chrome.manifest"
    cat "${_src_dir_3}/assets/chrome.manifest" >> "${_src_dir_2}/zotero/chrome.manifest"

    # Copy Error Console files
    cp "${_src_dir_3}/assets/console/jsconsole-clhandler.js" "${_src_dir_2}/zotero/components/"
    echo >> "${_src_dir_2}/zotero/chrome.manifest"
    cat "${_src_dir_3}/assets/console/jsconsole-clhandler.manifest" >> "${_src_dir_2}/zotero/chrome.manifest"
    cp -R "${_src_dir_3}/assets/console/content" "${_src_dir_2}/zotero/chrome/console"
    cp -R "${_src_dir_3}/assets/console/skin/osx" "${_src_dir_2}/zotero/chrome/console/skin"
    cp -R "${_src_dir_3}/assets/console/locale/en-US" "${_src_dir_2}/zotero/chrome/console/locale"
    cat "${_src_dir_3}/assets/console/jsconsole.manifest" >> "${_src_dir_2}/zotero/chrome.manifest"

    #copy unix skin
    cp -R "${_src_dir_3}/assets/unix/skin" "${_src_dir_2}/zotero/"
   
    # Delete files that shouldn't be distributed
    find "${_src_dir_2}/zotero/chrome" -name .DS_Store -exec rm -f {} \;

    # Zip chrome into JAR
    cd "${_src_dir_2}/zotero"
    zip -r -q zotero.jar chrome deleted.txt resource styles.zip translators.index translators.zip skin styles translators.json translators
    rm -rf "chrome/"* install.rdf deleted.txt resource styles.zip translators.index translators.zip skin styles translators.json translators
    cd ../../

    # Copy updater.ini
    cp "${_src_dir_3}/assets/updater.ini" "${_src_dir_2}/zotero"

    # Adjust chrome.manifest
    perl -pi -e 's^(chrome|resource)/^jar:zotero.jar\!/$1/^g' "${_src_dir_2}/zotero/chrome.manifest"

    # Adjust connector pref
    perl -pi -e 's/pref\("extensions\.zotero\.httpServer\.enabled", false\);/pref("extensions.zotero.httpServer.enabled", true);/g' "${_src_dir_2}/zotero/defaults/preferences/zotero.js"
    perl -pi -e 's/pref\("extensions\.zotero\.connector\.enabled", false\);/pref("extensions.zotero.connector.enabled", true);/g' "${_src_dir_2}/zotero/defaults/preferences/zotero.js"

    # Copy icons
    cp -r "${_src_dir_3}/assets/icons" "${_src_dir_2}/zotero/chrome/icons"

    # copy launcher
    cp zotero "${_src_dir_2}/zotero/"
    cp "${_src_dir_3}/linux/zotero.desktop" "${_src_dir_2}/zotero/"
    cp "${_src_dir_3}/linux/set_launcher_icon" "${_src_dir_2}/zotero/"

    # Copy application.ini and modify
    cp "${_src_dir_3}/assets/application.ini" "${_src_dir_2}/application.ini"
    perl -pi -e "s/\{\{VERSION}}/$pkgver/" "${_src_dir_2}/application.ini"
    perl -pi -e "s/\{\{BUILDID}}/aurbuild/" "${_src_dir_2}/application.ini"

    # Copy prefs.js and modify
    cp "${_src_dir_3}/assets/prefs.js" "${_src_dir_2}/zotero/defaults/preferences"
    perl -pi -e 's/pref\("app\.update\.channel", "[^"]*"\);/pref\("app\.update\.channel", "'"default"'");/' "${_src_dir_2}/zotero/defaults/preferences/prefs.js"

    #delete unnecessary files
    find "${_src_dir_2}" -name .DS_Store -exec rm -f {} \;
    find "${_src_dir_2}" -depth -type d -name .git -exec rm -rf {} \;
    rm -rf "${_src_dir_2}/zotero/test"


    }


package() {
    install -dDm755 "$pkgdir"/usr/{bin,lib/zotero}
    mv zotero "$pkgdir"/usr/lib/zotero/zotero
    mv "${_src_dir_2}"/zotero/* "${_src_dir_2}"/application.ini "$pkgdir"/usr/lib/zotero
    ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
    install -Dm644 "$pkgdir"/usr/lib/zotero/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop
    # Copy zotero icons to a standard location
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
    install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
    # Disable APP update
    sed -i '/pref("app.update.enabled", true);/c\pref("app.update.enabled", false);' "$pkgdir"/usr/lib/zotero/defaults/preferences/prefs.js
}
