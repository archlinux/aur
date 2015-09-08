# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Douglas Creager (dcreager AT dcreager DOT NET)
# Contributor: Josh David Miller (josh AT joshdavidmiller DOT COM)
# Contributor: David Pretty (david DOT pretty AT gmail DOT COM)
# Contributor: Johannes Zellner (johannes AT nebulon DOT DE)

# Unlike aws-cli which allows >= versions, this package checks and crashes
# if the exact == and < versions aren't installed.
# To build these, download the packages from the AUR or ABS and change the version.

set -u
_pybase='aws-eb-cli'
pkgbase="${_pybase}"
pkgname=("${_pybase}" "python2-${_pybase}")
_pybase="${_pybase//-/}"
pkgver='3.5.2'
pkgrel='1'
pkgdesc='The API and CLI tools that provide access to Amazon Elastic Beanstalk awsebcli'
arch=('any')
url='http://aws.amazon.com/code/6752709412171743'
_srcdir="${_pybase}-${pkgver}"
_verwatch=("https://pypi.python.org/simple/${_pybase}/" "${_pybase}-\([0-9\.]\+\)\.tar\.gz" 't')
source=("https://pypi.python.org/packages/source/${_pybase: 0:1}/${_pybase}/${_pybase}-${pkgver}.tar.gz")
makedepends=('python' 'python2')
license=( 'APACHE' )
sha256sums=('a753dbff9a9888b50ba13b221e6e8126e4697a1d61ba871e37c4ac782686da5f')

# Convert python requires to PKGBUILD depends
# $1: prefix python- or python2-
# $2: space separated list of packages to drop < or <=: 'foo bar'
#   (because our packages are often too new)
# $3: what to convert == to: '>=' or '='
# returns array _pydepends=()
_pyrequires() {
  # Paste in from setup.py. This function does NOT work in zsh.
local _requires="
requires = ['pyyaml>=3.11',
            'botocore>=1.0.1',
            'cement==2.4',
            'colorama==0.3.3',
            'pathspec==0.3.3',
            ## For docker-compose
            'docopt >= 0.6.1, < 0.7',
            'requests >= 2.6.1, < 2.7',
            'texttable >= 0.8.1, < 0.9',
            'websocket-client >= 0.11.0, < 1.0',
            'docker-py >= 1.1.0, < 1.2',
            'dockerpty >= 0.3.2, < 0.4',
            #found further down in setup.py
            'blessed==1.9.5',
           ]
"
  # Convert requires=[] to local _requires=()
  _requires="${_requires//requires = \[/local _requires=(}"
  _requires="${_requires//\]/)}"
  eval "${_requires}"
  _requires=("${_requires[@]// /}")    # embedded spaces
  _requires=("${_requires[@]%,}")      # trailing commas
  _requires=("${_requires[@]//==/$3}") # translate ==
  local _pynoless=" $2 "               # we can search for ' foo '
  _pydepends=()
  local _pyst1
  for _pyst1 in "${_requires[@]}"; do # foo>=0.0,<=0.0
    local _pyname="${_pyst1%%[<=>]*}" # foo
    _pyst1="${_pyst1#${_pyname}}"     # >=0.0,<=0.0
    local IFS=','
    local _pyst2=(${_pyst1})          # (>=0.0 <=0.0)
    _pyst2=("${_pyst2[@]/#/$1${_pyname}}") # (foo>=0.0 foo<=0.0)
    local _pystn
    for _pystn in "${!_pyst2[@]}"; do
      if [[ "${_pyst2[${_pystn}]}" == *\<* ]] && [ "${_pynoless// ${_pyname} /}" != "${_pynoless}" ]; then
        unset _pyst2[${_pystn}]
      fi
    done
    _pydepends+=("${_pyst2[@]}")
  done
}
_pyrequires 'python-' '' '='
# vercmp doesn't consider 2.4 and 2.4.0 equal
_pydepends=("${_pydepends[@]//python-cement=2.4/python-cement=2.4.0}")
unset -f _pyrequires

build() {
  set -u
  cd "${_srcdir}"
  python setup.py build
  # Fix the location of the dev tools
  #sed -i 's/LinuxClimbUpDepth\s=.*$/LinuxClimbUpDepth = 0/g' \
  #  ${srcdir}/AWS-ElasticBeanstalk-CLI-${pkgver}/eb/linux/python3/scli/constants.py
  #sed -i 's/LinuxRepoScript\s=.*$/LinuxRepoScript = \x27AWSDevTools\/AWSDevTools-RepositorySetup.sh\x27/g' \
  #  ${srcdir}/AWS-ElasticBeanstalk-CLI-${pkgver}/eb/linux/python3/scli/constants.py
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  python setup.py test --verbose
  set +u
}

package_aws-eb-cli() {
  set -u
  depends=('python' "${_pydepends[@]}")
  conflicts=("python2-${pkgbase}")
  cd "${_srcdir}"
  python 'setup.py' install --root "${pkgdir}"
  install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Install the files into /opt since they depend on a non-standard directory
  # structure.
  #mkdir -p ${pkgdir}/opt
  #cp -r ${srcdir}/AWS-ElasticBeanstalk-CLI-${pkgver}/eb/linux/python3 ${pkgdir}/opt/aws-eb-cli
  #cp -r ${srcdir}/AWS-ElasticBeanstalk-CLI-${pkgver}/AWSDevTools/Linux ${pkgdir}/opt/aws-eb-cli/AWSDevTools

  # Link the CLI program into /usr/bin
  #mkdir -p ${pkgdir}/usr/bin
  #ln -s ../../opt/aws-eb-cli/eb ${pkgdir}/usr/bin
  set +u
}

package_python2-aws-eb-cli() {
  set -u
  depends=('python2' "${_pydepends[@]//python-/python2-}")
  conflicts=("${pkgbase}")
  cd "${_srcdir}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 'LICENSE.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u


set +u
