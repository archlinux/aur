# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# thx for the original vim pkg:
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: tobias [ tobias at archlinux org ]
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_gitname=vim9
pkgbase=$_gitname-git
#pkgname=('vim9-tiny-git' 'vim9-cli-nox-git' 'vim9-cli-git' 'vim9-rt-git')
pkgname=('vim9-cli-nox-git' 'vim9-cli-git' 'vim9-rt-git')
pkgver=9.0.148+20200126.6fe9033b9
pkgrel=1
arch=('x86_64')
license=('custom:vim')
url="http://www.vim.org"
makedepends=('gpm' 'perl' 'python' 'lua' 'desktop-file-utils' 'gettext' 'pkgconfig' 'sed' 'git' 'ruby' 'libxt')
source=(
    "$_gitname::git://github.com/brammool/vim9.git"
    'license.txt'
)
sha256sums=('SKIP'
            'bb4744930a0030085d382356e9fdd4f2049b6298147aee2470c7fca7ec82fd55')

pkgver() {
	cd "$srcdir/$_gitname"
    local major_version="$(grep '#define VIM_VERSION_MAJOR\s' src/version.h | cut -d' ' -f3)"
    local minor_version="$(grep '#define VIM_VERSION_MINOR\s' src/version.h | cut -d' ' -f3)"
    local build_version="$(grep -A3 'static int included_patches' src/version.c | tail -n1 | sed -e 's/\s\+\([0-9]\+\).*/\1/')"
    echo "${major_version}.${minor_version}.${build_version}+$(git log -1 --date=short --format="%cd.%h" | tr -d '-')"
}

prepare() {
    # remove old build dirs if exist
    [ -d vim-build ] && rm -rf vim-build
    [ -d vim-build-tn ] && rm -rf vim-build-tn
    [ -d vim-build-nox ] && rm -rf vim-build-nox

    cp -a ${_gitname} vim-build
    (
        cd vim-build && rm -rf ./.git*
    )

    # define the place for the global (g)vimrc file (set to /etc/vimrc)
    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' \
        vim-build/src/feature.h
    sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' \
        vim-build/src/feature.h

    cp -a vim-build vim-build-tn
    cp -a vim-build vim-build-nox

    cd ${srcdir}/vim-build
    (cd src && autoconf)

    cd ${srcdir}/vim-build-tn
    (cd src && autoconf)

    cd ${srcdir}/vim-build-nox
    (cd src && autoconf)
}

build() {
    #msg2 'Building vim-tiny'
    #cd ${srcdir}/vim-build-tn
    #./configure --prefix=/usr --localstatedir=/var/lib/vim \
        #--mandir=/usr/share/man --with-compiledby=BlackEagle \
        #--with-global-runtime=/usr/share/vim/vim9 \
        #--with-features=tiny --disable-gpm --enable-acl --with-x=no \
        #--disable-gui --enable-multibyte --disable-cscope \
        #--disable-netbeans --disable-perlinterp --disable-pythoninterp \
        #--disable-rubyinterp --enable-luainterp=no
    #make VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9

    msg2 'Building vim-cli-nox'
    cd ${srcdir}/vim-build-nox
    ./configure --prefix=/usr --localstatedir=/var/lib/vim \
        --mandir=/usr/share/man --with-compiledby=BlackEagle \
        --with-global-runtime=/usr/share/vim/vim9 \
        --with-features=huge --enable-gpm --enable-acl --with-x=no \
        --disable-gui --enable-multibyte --enable-cscope \
        --disable-netbeans --enable-perlinterp=dynamic \
        --enable-python3interp=dynamic --enable-rubyinterp=dynamic \
        --enable-luainterp=dynamic
    make VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9

    msg2 'Building vim-cli'
    cd ${srcdir}/vim-build
    ./configure --prefix=/usr --localstatedir=/var/lib/vim \
        --mandir=/usr/share/man --with-compiledby=BlackEagle \
        --with-global-runtime=/usr/share/vim/vim9 \
        --with-features=huge --enable-gpm --enable-acl --with-x=yes \
        --disable-gui --enable-multibyte --enable-cscope \
        --disable-netbeans --enable-perlinterp=dynamic \
        --enable-python3interp=dynamic --enable-rubyinterp=dynamic \
        --enable-luainterp=dynamic
    make VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9
}

package_vim9-tiny-git() {
    pkgdesc='Vi Improved 9 experimental, tiny edition'
    depends=('acl')
    conflicts=('vim9-cli')

    cd ${srcdir}/vim-build-tn
    make -j1 VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9 \
        DESTDIR=${pkgdir} install

    # Runtime not needed
    rm -r ${pkgdir}/usr/share/vim
    
    # remove stuff provided by stable vim packages
    rm -r ${pkgdir}/usr/share/applications
    rm -r ${pkgdir}/usr/share/icons
    rm -r ${pkgdir}/usr/share/man

    # rename vim and remove stable stuff
    (
        cd "$pkgdir/usr/bin"
        mv vim vim9
        rm ex && ln -s vim9 ex9
        rm rview && ln -s vim9 rview9
        rm rvim && ln -s vim9 rvim9
        rm view && ln -s vim9 view9
        rm vimdiff && ln -s vim9 vimdiff9
        rm -f vimtutor
        rm -f xxd
    )

    # license
    install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
    install -Dm644 ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}

package_vim9-cli-nox-git() {
    pkgdesc='Vi Improved 9 experimental, cli nox'
    depends=("vim9-rt-git" 'gpm' 'acl')
    optdepends=(
        'perl: vim perl binding'
        'python: vim python3 binding'
        'lua: vim lua binding'
        'ruby: vim ruby binding'
    )
    conflicts=('vim9-cli')

    cd ${srcdir}/vim-build-nox
    make -j1 VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9 \
        DESTDIR=${pkgdir} install

    # Runtime provided by runtime package
    rm -r ${pkgdir}/usr/share/vim

    # remove stuff provided by stable vim packages
    rm -r ${pkgdir}/usr/share/applications
    rm -r ${pkgdir}/usr/share/icons
    rm -r ${pkgdir}/usr/share/man

    # rename vim and remove stable stuff
    (
        cd "$pkgdir/usr/bin"
        mv vim vim9
        rm ex && ln -s vim9 ex9
        rm rview && ln -s vim9 rview9
        rm rvim && ln -s vim9 rvim9
        rm view && ln -s vim9 view9
        rm vimdiff && ln -s vim9 vimdiff9
        rm -f vimtutor
        rm -f xxd
    )

    # no need for gvim references
    find "$pkgdir" -name "gvim.*" -delete

    # license
    install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
    install -Dm644 ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}

package_vim9-cli-git() {
    pkgdesc='Vi Improved 9 experimental, cli'
    depends=("vim9-rt-git" 'gpm' 'acl' 'libxt')
    optdepends=(
        'perl: vim perl binding'
        'python: vim python3 binding'
        'lua: vim lua binding'
        'ruby: vim ruby binding'
    )
    conflicts=('vim9-cli-nox')

    cd ${srcdir}/vim-build
    make -j1 VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9 \
        DESTDIR=${pkgdir} install

    ## Runtime provided by runtime package
    #rm -r ${pkgdir}/usr/share/vim
    # Move the runtime for later packaging
    mv ${pkgdir}/usr/share/vim ${srcdir}/runtime-install

    # remove stuff provided by stable vim packages
    rm -r ${pkgdir}/usr/share/applications
    rm -r ${pkgdir}/usr/share/icons
    rm -r ${pkgdir}/usr/share/man

    # rename vim and remove stable stuff
    (
        cd "$pkgdir/usr/bin"
        mv vim vim9
        rm ex && ln -s vim9 ex9
        rm rview && ln -s vim9 rview9
        rm rvim && ln -s vim9 rvim9
        rm view && ln -s vim9 view9
        rm vimdiff && ln -s vim9 vimdiff9
        rm -f vimtutor
        rm -f xxd
    )

    # no need for gvim references
    find "$pkgdir" -name "gvim.*" -delete

    # license
    install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
    install -Dm644 ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}

package_vim9-rt-git() {
    pkgdesc='Runtime for vim9 git'
    optdepends=(
        'python: tools'
        'gawk: tools'
    )

    cd ${srcdir}/vim-build
    make -j1 VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim/vim9 \
        DESTDIR=${pkgdir} install

    # remove non runtime files
    rm -r "${pkgdir}"/usr/share/applications/ \
        "${pkgdir}"/usr/share/icons/ \
        "${pkgdir}"/usr/share/man/ \
        "${pkgdir}"/usr/bin/

    # move vim82 to vim9
    mv "${pkgdir}/usr/share/vim/vim82" "${pkgdir}/usr/share/vim/vim9"

    # license
    install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
    install -Dm644 ${srcdir}/license.txt \
        ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}
