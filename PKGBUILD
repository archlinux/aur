# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='build-generator-stable-git'
pkgver=0.15.0.bdd4dec
pkgrel=1
pkgdesc='Generates jobs on a Jenkins server according to specifications'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/build-generator'
license=('LGPL3')
depends=('openssl' 'git' 'subversion' 'unp' 'mercurial' 'lsb-release' 'graphviz')
makedepends=('git' 'cmake' 'sbcl' 'cl-launch')
options=("!strip")
source=("build-generator::git+https://code.cor-lab.org/git/build-generator#branch=0.15"
        "rosetta::git+https://code.cor-lab.org/git/rosetta.git.cl")
md5sums=('SKIP'
         'SKIP')
conflicts=('build-generator')
provides=('build-generator')

_qlver='2017-08-30'

pkgver() {
    cd "${srcdir}/build-generator"
    printf "%s" "$(git describe --tags --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}"
    if ! [ -f quicklisp/setup.lisp ]
    then
        mkdir -p quicklisp
        curl -O http://beta.quicklisp.org/quicklisp.lisp
        sbcl \
            --noinform --no-userinit --disable-debugger \
            --load quicklisp.lisp \
            --eval '(quicklisp-quickstart:install
                     :dist-version "quicklisp/'"${_qlver}"'"
                     :path         "'"$(pwd)"'/quicklisp")' \
            --quit
    fi

    # hack custom quicklisp path into cl-launch
    sed -e 's#(try (subpathname (user-homedir-pathname) "quicklisp/setup.lisp"))#(try "'"${srcdir}"'/quicklisp/setup.lisp")\
        (try (subpathname (user-homedir-pathname) "quicklisp/setup.lisp"))#;' "$(which cl-launch)" > "${srcdir}/cl-launch"
    chmod +x "${srcdir}/cl-launch"

    # better version reporting
    echo "${pkgver}" | sed 's/.*\..*\.\(.*\)\.\(.*\)/\1 "\2"/' > "${srcdir}/build-generator/version.sexp"
}

build() {
    cd "${srcdir}/build-generator"
    export ASDF_OUTPUT_TRANSLATIONS="/:${srcdir}/fasl-cache"
    export CC=cc
    "${srcdir}/cl-launch" -Q \
        -S "(:source-registry \
             (:tree \""${srcdir}"\")
             :ignore-inherited-configuration)" \
        -s jenkins.project.commandline-interface \
        --dump ! --output "build-generator" \
        -r "jenkins.project.commandline-interface:main"
}

package() {
    cd "${srcdir}/build-generator"
    install -D "${srcdir}/build-generator/build-generator" "${pkgdir}/usr/bin/build-generator"
}
