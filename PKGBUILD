# Maintainer:

# packaging options
: ${_default:=2stems}
: ${_allstems:=false}
: ${_finetune:=false}
: ${_srcinfo:=false}

# lowercase
for i in _allstems _finetune _srcinfo ; do
  eval "${i}=\$( printf '%s' \"\${$i::1}\" | sed -e 's/^\(.*\)$/\L\1/' )"
done

set_model_source() {
  case $1 in
    '2stems')
      # 69.7
      source+=("$url/releases/download/v$pkgver/$1.tar.gz")
      sha256sums+=('f3a90b39dd2874269e8b05a48a86745df897b848c61f3958efc80a39152bd692')
      ;;
    '4stems')
      # 140
      source+=("$url/releases/download/v$pkgver/$1.tar.gz")
      sha256sums+=('3adb4a50ad4eb18c7c4d65fcf4cf2367a07d48408a5eb7d03cd20067429dfaa8')
      ;;
    '5stems')
      # 174
      source+=("$url/releases/download/v$pkgver/$1.tar.gz")
      sha256sums+=('25a1e87eb5f75cc72a4d2d5467a0a50ac75f05611f877c278793742513cc7218')
      ;;
    '2stems-finetune')
      # 206
      source+=("$url/releases/download/v$pkgver/$1.tar.gz")
      sha256sums+=('SKIP')
      ;;
    '4stems-finetune')

      # 409
      source+=("$url/releases/download/v$pkgver/$1.tar.gz")
      sha256sums+=('SKIP')
      ;;
    '5stems-finetune')
      # 512
      source+=("$url/releases/download/v$pkgver/$1.tar.gz")
      sha256sums+=('SKIP')
      ;;
  esac
}

_pkgname="spleeter-data"
pkgbase="$_pkgname"

pkgver=1.4.0
pkgrel=1
pkgdesc="Deezer music source separation library - pretrained model"
# https://research.deezer.com/projects/spleeter.html
url="https://github.com/deezer/spleeter"
arch=('any')
license=('MIT')

depends=()
makedepends=()

provides=("$_pkgname")
conflicts=()

options=("!strip")

install="$_pkgname.install"

source+=(
  "https://raw.githubusercontent.com/deezer/spleeter/master/LICENSE"
)
sha256sums+=(
  'b15e40c921ec6fe997e0d88ddab9c26fb915bebbbb9496530d3f98f317d4325a'
)

case "$_srcinfo" in
  't'|'y'|'1')
    _allstems='t'
    _finetune='t'
    ;;
esac

case "$_allstems" in
  't'|'y'|'1')
    _models=(2stems 4stems 5stems)
    ;;
  *)
    _models=("$_default")
    ;;
esac

case "$_finetune" in
  't'|'y'|'1')
    for _model in ${_models[@]} ; do
      _models+=("$_model-finetune")
    done
    ;;
esac

for _model in ${_models[@]} ; do
  pkgname+=(
    "$_pkgname-$_model"
  )

  set_model_source "$_model"
done


_package() {
  install -vDm0644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname-$1"
  install -vDm0644 model.* -t "$pkgdir/opt/$_pkgname/$1"
  install -vDm0644 checkpoint -t "$pkgdir/opt/$_pkgname/$1"
}

for _model in ${_models[@]} ; do
  eval "package_$_pkgname-$_model() {
          pkgdesc+=\" - $_model\"
          _package $_model
        }"
done
