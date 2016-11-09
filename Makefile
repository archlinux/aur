update: clean wcwidthcallback.patch

wcwidthcallback.patch:
	curl -s https://github.com/exg/rxvt-unicode/compare/master...blueyed:wcwidth-hack.diff > $@

clean:
	$(RM) -f wcwidthcallback.patch
