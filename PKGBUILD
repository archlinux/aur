# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgbase=nemo-extensions
pkgbase=${_pkgbase}-git
_pkgname=('nemo-fileroller'
          'nemo-engrampa'
          'nemo-image-converter'
          'nemo-preview'
          'nemo-python'
          'nemo-seahorse'
          'nemo-share'
          'nemo-terminal'
          'nemo-audio-tab'
          'nemo-compare'
          'nemo-dropbox'
          'nemo-emblems'
#         'nemo-gtkhash'
          'nemo-media-columns'
          'nemo-pastebin'
          'nemo-repairer')
pkgname=()
for _p in "${_pkgname[@]}" ; do 
	pkgname+=(${_p}-git)
done
_pkgver=4.0.0
pkgver=4.0.0+10+gd8c20fa
pkgrel=1
pkgdesc="Various extensions for Nemo"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo')
_preview_deps=('cjs' 'clutter-gtk' 'clutter-gst' 'libmusicbrainz5' 'gtksourceview3' 'xreader')
_python_deps=('python-gobject')
_seahorse_deps=('libcryptui' 'libgnome-keyring')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'git' 'meson')
makedepends+=("${_preview_deps[@]}" "${_python_deps[@]}" "${_seahorse_deps[@]}")
options=('!emptydirs')
source=("${pkgbase}::git+https://github.com/linuxmint/nemo-extensions"
        'dropbox-remove-python-deps.patch')
sha256sums=('SKIP'
            'ac695b3d847368606f5a551db198942dcc0422c20dadf5f6524c2d41ad54a499')
_release_commit='cdb9295e31d70924e5f7de2367b596f8e191a7cd'

pkgver() {
    cd "${srcdir}/${pkgbase}"
    printf "%s+%s+%s" \
               "${_pkgver}" \
               "$( bc <<< "`git rev-list HEAD --count` - `git rev-list ${_release_commit} --count`" )" \
               "$( git describe --long | sed 's:.*-::' )"
}

prepare() {
    cd "${srcdir}/${pkgbase}"

    # Delete deprecated gnome-common macros, even their standard autoconf-archive replacements are
    # annoying to people who actually set $C(XX)?FLAGS. This drops the unneeded dependency on gnome-common
    sed -i '/^GNOME_/d' nemo-image-converter/configure.ac

	# nemo-engrampa patches
	[ -d nemo-engrampa ] && rm -fr nemo-engrampa
	cp -r nemo-fileroller nemo-engrampa
	cd nemo-engrampa/src
    for _file in $( ls | grep fileroller ) ; do
        mv "${_file}" "${_file/fileroller/engrampa}"
    done
    cd "${srcdir}/${pkgbase}"
    find ./nemo-engrampa -type f -exec sed -i -E \
        -e 's:file[\ \-]?roller:engrampa:g' \
        -e 's:File[\ \-]?[rR]oller:Engrampa:g' '{}' \;
    
    # nemo-dropbox patches
    cd "${srcdir}/${pkgbase}"/nemo-dropbox
    patch -uNp2 -r- -i "${srcdir}"/dropbox-remove-python-deps.patch
    
    cd "${srcdir}/${pkgbase}"
    for _dir in "${_pkgname[@]}"; do
        if ! [[ -f ${_dir}/configure.ac || -f ${_dir}/configure.in ]]; then
            continue
        fi
        pushd ${_dir}
        autoreconf -fi
        popd
    done
}

build() {
    cd "${srcdir}/${pkgbase}"

    for _dir in "${_pkgname[@]}"; do
        if [[ -f ${_dir}/configure ]]; then
            pushd ${_dir}
            ./configure --prefix=/usr \
                        --sysconfdir=/etc \
                        --localstatedir=/var \
                        --libexecdir=/usr/lib/${_dir} \
                        --disable-schemas-compile
            sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
            make
            popd
        elif [[ -f ${_dir}/meson.build ]] ; then
            pushd ${_dir}
            [ -d build ] && rm -fr build
            mkdir -p build
            cd build
            meson --prefix=/usr \
                --libexecdir=lib/${_dir} \
                --buildtype=plain \
                .. 
            #sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
            ninja
            popd
        fi
    done

    # # nemo-pastebin
    cd nemo-pastebin
    python ./setup.py build --build-base ${srcdir}/build/ || return 1
    cd ..
}

package_nemo-fileroller-git() {
    pkgdesc="File archiver extension for Nemo"
    license=('GPL2')
    depends+=('file-roller')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}

package_nemo-engrampa-git() {
    pkgdesc="File archiver extension for Nemo using engrampa"
    license=('GPL2')
    depends+=('engrampa')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}

package_nemo-image-converter-git() {
    pkgdesc="Nemo extension to rotate/resize image files"
    license=('GPL2')
    depends+=('imagemagick')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}

package_nemo-preview-git() {
    pkgdesc="Quick file previewer for Nemo"
    license=('GPL2')
    depends+=("${_preview_deps[@]}")
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}

package_nemo-python-git() {
    pkgdesc="Python binding for Nemo components"
    license=('GPL2')
    depends+=("${_python_deps[@]}")
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"/build
    DESTDIR="${pkgdir}" ninja install
}

package_nemo-seahorse-git() {
    pkgdesc="PGP encryption and signing extension for Nemo"
    license=('GPL2')
    depends+=("${_seahorse_deps[@]}")
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}

package_nemo-share-git() {
    pkgdesc="Samba extension for Nemo"
    license=('GPL2')
    depends+=('samba')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}

package_nemo-terminal-git() {
    pkgdesc="Embedded terminal window for Nemo"
    arch=('any')
    license=('GPL3')
    depends=('nemo-python>=3.9.0' 'vte3')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
  	python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}

package_nemo-media-columns-git() {
    pkgdesc="A Nemo extension to display music/EXIF and PDF metadata info in the Nemo List View"
    arch=('any')
    license=('GPL2')
    depends=('nemo-python>=3.9.0' 'python-mutagen' 'exiv2' 'python-pymediainfo' 'python-pillow' 'python-pypdf2')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
  	python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}

package_nemo-pastebin-git() {
  	pkgdesc="Nemo extension to send files to a pastebin"
 	arch=('any')
    license=('GPL2')
  	depends=('pastebinit' 'nemo-python>=3.9.0')
  	optdepends=('libnofify')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
  	python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}

package_nemo-audio-tab-git() {
	pkgdesc="View audio tag information in Nemo's properties tab"
	license=('GPL2')
	arch=('any')
	depends=('nemo-python>=3.9.0' 'python-mutagen')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")
	
    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
  	python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}

package_nemo-dropbox-git() {
    pkgdesc="Dropbox for Linux - Nemo extension"
	license=('custom:CC-BY-ND-3' 'GPL3')
	depends+=('dropbox')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")
    
    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
    # install the common license
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_nemo-compare-git() {
    pkgdesc="Context menu comparison extension for Nemo file manager"
    arch=('any')
    license=('GPL3')
    depends=('nemo-python>=3.9.0' 'python-xdg' 'python-gobject')
    optdepends=('meld: Install at least one file comparison program'
                'kompare: Additional comparison options (preferred diff, three-way, multi-compare)'
	            'fldiff: Additional comparison options (preferred diff, three-way, multi-compare)'
	            'diffuse: Alternate comparison backend'
	            'kdiff3: Alternate comparison backend')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
  	python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}

package_nemo-emblems-git() {
    pkgdesc="Nemo file emblems extension"
    arch=('any')
    license=('GPL3')
    depends=('nemo-python>=3.9.0')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")
    
    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
  	python ./setup.py install --prefix=/usr --root="${pkgdir}" \
  		--no-compile -O0
}

package_nemo-repairer-git() {
    pkgdesc="Nemo extension for filename encoding repair"
    license=('GPL2')
    provides=("${pkgname/-git/}=${_pkgver}")
    conflicts=("${pkgname/-git}")

    cd "${srcdir}/${pkgbase}/${pkgname/-git/}"
    make DESTDIR="${pkgdir}" install
}
