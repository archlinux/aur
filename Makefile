.PHONY: all

all: clean srcinfo rebuild

rebuild:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src chatterino7/ chatterino2-*.pkg.tar.{xz,zst} \
		libcommuni \
		humanize \
		qBreakpad \
		WinToast \
		settings \
		signals \
		serialize \
		rapidjson \
		qtkeychain \
		websocketpp \
		sanitizers-cmake \
		magic_enum \
		googletest
