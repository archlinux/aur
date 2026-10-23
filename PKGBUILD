# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>

pkgbase=hunspell-rm
pkgname=(hunspell-rm hyphen-rm)
_commit=a2b127603bab2993684599ec53e0fe6ddcd0b1d6
pkgver=2026.10.14
pkgrel=1
pkgdesc="Romansh dictionaries of the Lia Rumantscha: Rumantsch Grischun and the five idioms"
arch=('any')
url="https://github.com/farscrl/spellcheckers-rumantschs"
license=('MIT')
checkdepends=('hunspell')
source=("$pkgbase-$_commit.tar.gz::https://github.com/farscrl/spellcheckers-rumantschs/archive/$_commit.tar.gz")
sha256sums=('35f83c273be932b011f9e3c62bc1f7fdcac8aa8c674a2e7b4841c1f3acf4f30f')

_idioms=(rumgr sursilv sutsilv surmiran puter vallader)

build() {
    local d="$srcdir/spellcheckers-rumantschs-$_commit/dictionaries"
    local h="$srcdir/stage/usr/share/hunspell" y="$srcdir/stage/usr/share/hyphen"
    local i a

    # The tree is put together here instead of within package(), ensuring that
    # check() tests the names that are actually shipped.
    rm -rf "$srcdir/stage"
    install -d "$h" "$y"

    # The upstream names are the actual files: they represent the tags that
    # the Lia Rumantscha's own LibreOffice extensions register, meaning a
    # document created using those extensions is verified against these
    # dictionaries as well.
    for i in "${_idioms[@]}"; do
        install -m644 "$d/rm-$i/rm-$i.aff" "$d/rm-$i/rm-$i.dic" "$h/"
    done

    # Rumantsch Grischun also answers to plain Romansh. LibreOffice
    # identifies Rhaeto-Romance as rm_CH, the same code that Word embeds in
    # documents, while Firefox uses rm when matching lang="rm". Upstream makes the
    # same choice: its Firefox add-on deploys Rumantsch Grischun under the
    # identifier rm.
    for a in rm_CH rm; do
        ln -s rm-rumgr.aff "$h/$a.aff"
        ln -s rm-rumgr.dic "$h/$a.dic"
    done

    # Upstream delivers a single set of hyphenation patterns along with a
    # duplicate for each idiom. A single file gets installed, and each tag
    # associated with a spelling dictionary refers to it, since LibreOffice
    # retrieves hyphenation data using the very same tag.
    install -m644 "$d/hyph_rm.dic" "$y/hyph_rm.dic"
    for a in rm_CH "${_idioms[@]/#/rm-}"; do
        ln -s hyph_rm.dic "$y/hyph_$a.dic"
    done
}

check() {
    local d="$srcdir/spellcheckers-rumantschs-$_commit/dictionaries"
    local h="$srcdir/stage/usr/share/hunspell"
    local fail=0 i j n out want

    # Every idiom carries its unique term for "I". A dictionary must embrace its
    # own version and reject the remaining five, meaning any that is empty,
    # truncated, or substituted by another will cause the build to fail rather
    # than proceed to shipment.
    local -A marker=([rumgr]=jau [sursilv]=jeu [sutsilv]=jou [surmiran]=tgesa [puter]=eau [vallader]=eu)
    local -A accept=(
        [rumgr]="lingua utilisader translaziun actualisaziun segirezza calculatur tscherni grazia"
        [sursilv]="lungatg segirezia lingua utilisader translaziun actualisaziun grazia")
    local -A reject=(
        [rumgr]="lungatg segirezia utilisadr tranlaziun translaziunn tschernei"
        [sursilv]="segirezza calculatur tscherni utilisadr tranlaziun translaziunn tschernei")

    # The aliases are validated according to the name they are shipped under:
    # they must act as Rumantsch Grischun does.
    local -A tested=([rm-rumgr]=rumgr [rm-sursilv]=sursilv [rm-sutsilv]=sutsilv
                     [rm-surmiran]=surmiran [rm-puter]=puter [rm-vallader]=vallader
                     [rm_CH]=rumgr [rm]=rumgr)

    for n in "${!tested[@]}"; do
        i=${tested[$n]}
        # The number on the first line is an estimate from upstream, differing
        # by up to 80 from the actual count of lines that come after.
        local count=$(head -n1 "$h/$n.dic")
        if ! [[ $count =~ ^[0-9]+$ ]] || (( count < 100000 || $(wc -l < "$h/$n.dic") * 100 < count * 98 )); then
            echo "$n.dic: empty or truncated (first line: $count)" >&2; fail=1; continue
        fi
        # Without the -i UTF-8 flag, hunspell operating within the C locale of a
        # clean chroot performs word splitting at accented letters.
        out=$(printf '%s\n' "${marker[$i]}" ${accept[$i]-} | hunspell -i UTF-8 -d "$h/$n" -l)
        [[ -z $out ]] || { echo "$n rejects: ${out//$'\n'/ }" >&2; fail=1; }
        want=$(for j in "${!marker[@]}"; do [[ $j == "$i" ]] || echo "${marker[$j]}"; done
               printf '%s\n' ${reject[$i]-})
        out=$(printf '%s\n' "$want" | hunspell -i UTF-8 -d "$h/$n" -l)
        if [[ $(sort <<<"$out") != "$(sort <<<"$want")" ]]; then
            echo "$n accepts: $(comm -13 <(sort <<<"$out") <(sort <<<"$want") | tr '\n' ' ')" >&2
            fail=1
        fi
    done

    # A single licence file and a single hyphenation file are deployed across all
    # six idioms, which is only appropriate as long as upstream's copies remain
    # identical.
    for i in "${_idioms[@]}"; do
        cmp -s "$d/rm-$i/rm-${i}_LICENSE.txt" "$d/rm-rumgr/rm-rumgr_LICENSE.txt" ||
            { echo "rm-$i: licence differs from rm-rumgr's" >&2; fail=1; }
        cmp -s "$d/rm-$i/hyph_rm-$i.dic" "$d/hyph_rm.dic" ||
            { echo "rm-$i: hyphenation differs from hyph_rm.dic" >&2; fail=1; }
        cmp -s "$d/rm-$i/hyph_rm-${i}_LICENSE.txt" "$d/hyph_rm_LICENSE.txt" ||
            { echo "rm-$i: hyphenation licence differs from hyph_rm_LICENSE.txt" >&2; fail=1; }
    done

    return $fail
}

package_hunspell-rm() {
    pkgdesc="Romansh hunspell dictionaries of the Lia Rumantscha: Rumantsch Grischun, Sursilvan, Sutsilvan, Surmiran, Puter and Vallader"
    optdepends=('hunspell: the spell checking library and command line tool')
    provides=('hunspell-dictionary')

    local d="$srcdir/spellcheckers-rumantschs-$_commit/dictionaries" f i

    install -d "$pkgdir/usr/share" "$pkgdir/usr/share/myspell/dicts"
    cp -a "$srcdir/stage/usr/share/hunspell" "$pkgdir/usr/share/"
    for f in "$pkgdir"/usr/share/hunspell/*; do
        ln -s "/usr/share/hunspell/${f##*/}" "$pkgdir/usr/share/myspell/dicts/"
    done

    for i in "${_idioms[@]}"; do
        install -Dm644 "$d/rm-$i/rm-${i}_version.txt" -t "$pkgdir/usr/share/doc/$pkgname/"
    done
    install -Dm644 "$d/rm-rumgr/rm-rumgr_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hyphen-rm() {
    pkgdesc="Romansh hyphenation patterns of the Lia Rumantscha, for Rumantsch Grischun and the five idioms"
    optdepends=('hyphen: the hyphenation library')

    local d="$srcdir/spellcheckers-rumantschs-$_commit/dictionaries" f

    install -d "$pkgdir/usr/share" "$pkgdir/usr/share/myspell/dicts"
    cp -a "$srcdir/stage/usr/share/hyphen" "$pkgdir/usr/share/"
    for f in "$pkgdir"/usr/share/hyphen/*; do
        ln -s "/usr/share/hyphen/${f##*/}" "$pkgdir/usr/share/myspell/dicts/"
    done

    install -Dm644 "$d/hyph_rm_LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
