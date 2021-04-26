v2.2.0
======

Minor cleanup.

Restored package version reporting when fetching URLs.

v2.1.0
======

Adopted `jaraco/skeleton <https://github.com/jaraco/skeleton>`_.

Delinted codebase.

Removed ``cssutils.VERSION`` and ``cssutils.__version__``.
Consumers wishing to know the version should use
``importlib.metadata.version('cssutils')``.

v2.0.0
======

New `maintainer <https://pypi.org/user/jaraco>`_ revives the project
and moves `hosting <https://github.com/jaraco/cssutils>`_ with
continuous integration testing.

Refreshed packaging.

Project now requires Python 3.6 or later.

v1.0.2
======

Undocumented changes.

v1.0.1
======

Undocumented changes.

v1.0
====

(1.0 only cause I was tired of the 0.9.x releases ;)

	- EXPERIMENTAL: Variable references may have a fallback value now (as implemented in Firefox 29). It is available as ``CSSVariable.fallback`` and example are::

		bottom: var(b);
		color: var(theme-colour-1, rgb(14,14,14));
		left: var(L, 1px);
		z-index: var(L, 1);
		top: var(T, calc( 2 * 1px ));
		background: var(U, url(example.png));
		border-color: var(C, #f00)

	- FEATURE: (Bitbucket #37) Implemented parsing of ``CSSCalc`` values. General syntax is checked but not if operators in calc are actually the right kind like DIMENSION * DIMENSION. Also Values using calc do not validate in cssutils but are actually valid.

	- FIXED Bitbucket #20 and Bitbucket #35 (Test fail CSSParser.parseUrl() error with Python 3.3)

	- FIXED Bitbucket #21: (almost all) deprecation warning in Py 3.3 fixed.

	- FIXED Bitbucket #30 (Test failed)

	- FIXED Bitbucket #33 (well kinda): Added that cssutils is **not** threadsafe!

	- FIXED Bitbucket #34: More complext MediaQueries should be parsable now. A few slight changes in behavior are:
		 - ``xml.dom.SyntaxErr`` raised instead of ``xml.dom.InvalidCharacterErr`` for an unknown media type
		 - removed ``handheld`` media type special case (for old Opera).

v0.9.10
=======

    - BUGFIX: False HASH color values like ``#xyz`` were not being handled properly (thanks to Teruaki Koizumi)

    - Fixed Bitbucket #23: Tests do work properly in newer Python (>2.7.1?) version now, old versions will report error. Before this was the other way round but this makes more sense probably

    - Fixed Bitbucket #24: rgba color values did not validate properly

    - (Jason R. Coombs) Fixed Bitbucket #25: Cssutils installs "tests" package

    - Fixed Bitbucket #27: Small magnitude float values serialized incorrectly

    - Fixed Bitbucket #28: Standalone semicolons in CSSStyleDeclaration is now simply stripped and does not remove directly following property too

0.9.10b1 120428
    - **REGRESSION**: Valid profiles reported by validation may not be right but as these hardly say anything in the real world anyway the advancements in the following bugfixes are probably worth this. ``Profiles.validateWithProfile`` currently not working but should be hardly used anyway. As a workaround remove all profiles and add just the ones you want to use for your application

    - **BUGFIX**: Profiles have been updated. Multiple profiles can be added via ``addProfiles`` and this is preferred to adding separate profiles with ``addProfile``. Profiles do check for updated macros now so that e.g. CSS3 Colors defined in a different profile are valid for all properties defined before. This may lead to a reset of all properties and so may be an extremely expensive operation.

    - BUGFIX: font-family names in profile CSS3_FONTS seem to have been defined wrongly. Family names containing spaces are valid now, even without quotes.

    - BUGFIX: for Python 2.5 compatibility (thanks @Jason)

    + IMPROVEMENT: Added all X11 color names and corresponding RGBA values

v0.9.9
======

    - FEATURE: Implemented API for ``MarginRule`` objects inside ``CSSPageRule``, see http://www.w3.org/TR/css3-page/. You can also use e.g. ``CSSPageRule['@top-left']`` to retrieve the MarginRule it it is set etc. All dict like methods should be there. If a margin is set twice or more all properties are merged into a single margin rule. Double set properties are all kept though (see below).

    - FEATURE: ``parseStyle()`` has optional parameter ``validate=False`` now too to disable validation (default is always ``True``).

    - FEATURE: ``CSSStyleDeclaration.setProperty`` has new option ``replace=True``. if True (DEFAULT) the given property will replace a present property. If False a new property will be added always. The difference to `normalize` is that two or more properties with the same name may be set, useful for e.g. stuff like::

            background: red;
            background: rgba(255, 0, 0, 0.5);

      which defines the same property but only capable UAs use the last property value, older ones use the first value.

    + CHANGE: @rules attribute ``atkeyword`` value is now normalized. The actual keyword (example ``@IMPorT``) is kept and is optionally reserialized but in the example ``atkeyword == '@import'``

    - BUGFIX: 'auto' is now an invalid CSSPageRule pagename.
    - BUGFIX: Fixed issue for GoogleAppEngine (GAE) which somehow handles codecs differently. ``parseUrl`` should work now.



v0.9.8
======

0.9.8 final 111210
    - FEATURE: Feature Request (Bitbucket #4) to be able to disable validation of a stylesheet has been implemented. Add Parameter ``validate=False`` for parsing.

    + BUGFIX: Fixed Bitbucket #5 Unicode escaping inside strings. Thanks to Simon Sapin
    + BUGFIX: The integer is optional in counter-reset and counter-increment, and not only on the first counter. Thanks to Simon Sapin
    + BUGFIX: Fix for unicode replacements by Denis Bilenko, thanks!  https://bitbucket.org/cthedot/cssutils/pull-request/1/fix-a-bug-in-regex-which-accidentally

    - IMPROVEMENT: ``parseStyle`` moved to CSSParser, thanks to Simon Sapin


0.9.8a3 110727
    + BUGFIX: Fixed validation of ``size`` property (thanks to Simon Sapin)
	+ BUGFIX: Fixed Issue Bitbucket #55 (thanks to Simon Sapin): `outline-color` property was missing from validation.
    + BUGFIX: Fixed resolution of encoding detection of a stylesheet which did not use @charset in certain circumstances (mainly when imported sheets use different encoding than importing one which should be quite rare actually).

    - FEATURE: Added ``URIValue.absoluteUri`` (thanks to Simon Sapin)
    - FEATURE: Issue Bitbucket #53 feature request: Added new Preference option ``cssutils.ser.prefs.indentClosingBrace``. Defines if closing brace of block is indented to match indentation of the block (default) oder match indentation of selector.
    - FEATURE: Feature request: Added new Preference option ``cssutils.ser.prefs.omitLeadingZero``. Defines if values between -1 and 1 should omit the 0, like ``.5px``. Minified settings do this, else 0 is kept by default.

    + CHANGE (minor): Some error messages have slightly changed due to a simpler compatibility to Python 3. Problem are any ``u'...'`` texts inside error messages which now are simplified, some without and quotes. Changed are e.g. error messages by ``Property``.

    - **IMPROVEMENT**: Python 3 support. At least the unittests run in Python 2.5, 2.6, 2.7, 3.2 and Jython 2.5.1 now. Both encutils (with support by Fredrik Hedman, thanks!) and cssutils (thanks to Jaraco) and the CSS codec (thanks to Walter Dörwald) seem to work with Python 3 (tested on Python 3.2.1 Win64). Tests use Mock instead of MiniMock now as former is available for Python 2.x and 3.x.

    - **IMPROVEMENT**: Parsing of longer (and probably invalid) ``font`` or ``font-family`` values was *extremely* slow due to a very complex regex. This has been changed and parsing of specific stylesheets using these values should be much faster now. (``macros[Profiles.CSS_LEVEL_2]['font-family']`` is gone so if you used this in your own validation modules you need to check the source in `profiles.py`.)

    - IMPROVEMENT: Fixed Issue Bitbucket #54 (thanks to Simon Sapin): Short hand like `#f80` color value object have correct red, green and blue property values now. Also ``hsl()`` and ``hsla()`` colors report (almost) correct values (due to rounding problems).

    - **Source control has moved to bitbucket https://bitbucket.org/cthedot/cssutils**. Older Issues are currently still at Google Code, newer at Bitbucket. Please do not use Google Code for new issue reports anymore!


0.9.8a2 110611
    - BUGFIX: Fixed Issue Bitbucket #59 which showed a rather strange problem with longer space separated lists of font-family values being so slow to actually stop parsing.

    - BUGFIX/IMPROVEMENT: Fixed Issue Bitbucket #48. ``CSSParser.parseUrl()`` uses the defined fetcher of this parser *for the initial stylesheet* at url too and not just the imported sheets *from* this sheet.

    - BUGFIX: Fixed Issue Bitbucket #50 which prevented cssutils parsing the acid2.css file correctly. Problem were selectors starting directly with ``[class]`` (an attribute selector).

    + **API CHANGE (major)**
        (Known) named colors are parsed as ColorValue objects now. These are the 16 simple colors (black, white, etc) and `transparent` but not all Extended color keywords yet. Also changed ``ColorValue.type`` to ``Value.COLOR_VALUE``. ColorValue has additional properties ``red, green, blue, alpha`` and ``colorType`` which is one of IDENT, HASH or FUNCTION for now.

    + API CHANGE (minor)
        Removed already DEPRECATED ``cssutils.parse`` and ``CSSParser.parse``. Use the more specific functions/methods ``parseFile parseString parseUrl`` instead.

        Removed already DEPRECATED  ``cssutils.log.setlog`` and ``.setloglevel``. Use ``.setLog`` and ``.setLevel`` instead.

        Removed already DEPRECATED  ``cssutils.ser.keepUnkownAtRules`` (note the typo). Use ``.keepUnknownAtRules`` instead.

    - IMPROVEMENT: Added validation profiles for some properties from `CSS Backgrounds and Borders Module Level 3 <http://www.w3.org/TR/css3-background/>`__, `CSS3 Basic User Interface Module <http://www.w3.org/TR/css3-ui/#resize>`__, `CSS Text Level 3 <http://www.w3.org/TR/css3-text/>`__
        mainly  `cursor`, `outline`, `resize`, `box-shadow`, `text-shadow`


0.9.8a1 101212
    + **API CHANGE (major)**
        replace CSSValue with PropertyValue, Value and other classes.

        NEW CLASSES:
            :class:`cssutils.css.PropertyValue`
                replaces CSSValue and CSSValueList

                - is iterable (iterates over all single Value objects which in soruce CSS might be separated by "," "/" or " "
                - a comma separated list of IDENT values is no longer handled as a single String (e.g. ``Arial, sans-serif``)

            :class:`cssutils.css.Value`
                replaces CSSPrimitiveValue with separate ``value`` and ``type`` info (value is typed, so e.g. string for e.g. STRING, IDENT or URI values, int or float) and is base class for more specific values like:

            :class:`cssutils.css.URIValue`
                replaces CSSPrimitiveValue, additional attribute ``uri``

            :class:`cssutils.css.DimensionValue`
                replaces CSSPrimitiveValue, additional attribute ``dimension``

            :class:`cssutils.css.ColorValue`
                replaces CSSPrimitiveValue, additional attribute ``red``, ``green``, ``blue`` and ``alpha``

                **TODO: Not yet complete, only rgb, rgba, hsl, hsla and has values use this object and color and alpha information no done yet!**

            :class:`cssutils.css.CSSFunction`
                replaces CSSPrimitiveValue function, not complete yet

            also renamed ``ExpressionValue`` to :class:`cssutils.css.MSValue` with new API

    - IMPROVEMENT/CHANGE: Validation of color values is tighter now. Values like ``hsl(1, 2, 3)`` do not validate as it must be ``hsl(1, 2%, 3%)``. This mostly effects HSL/A and RGB/A notation.

    - **IMPROVEMENT**: New Value parsing and API accelerate parsing of style declarations which take about 20-30% less time now. Of course this depends on the complexity of your styles.

    + BUGFIX: fixes Bitbucket #41, Bitbucket #42, Bitbucket #45, Bitbucket #46
        PropertyValue.value returns value without any comments now, else use PropertyValue.cssText

    - FEATURE: ``cssutils.replaceUrls()`` accepts as first argument a `cssutils.css.CSSStyleSheet` but now also a
        :class:`cssutils.css.CSSStyleDeclaration` object, so may be used like the following which is useful when you work with HTML style attributes::

                >>> style = cssutils.parseStyle("background-image: url(1.png), url('2.png')")
                >>> cssutils.replaceUrls(style, lambda url: 'prefix/'+url)
                >>> print style.cssText
                background-image: url(prefix/1.png), url(prefix/2.png)

        (I omitted the validation error message as more than one background-image is not yet defined in the cssutils validator but does parse through without problems)

    + CHANGE: explicit `+` of any dimension, percentage of number value is kept now instead of being stripped as if put explicitly in the author SHOULD have meant something ;)


v0.9.7
======

    + **FUTURE CHANGE**: CSSValue and subclasses will most certain not be supported in the next cssutils 0.9.8 version. A simpler and hopefully more robust API is in development. So the next version will have incompatible changes so you might wanna use 0.9.8 from the start if you do anything fancy with CSSValue and related classes.

0.9.7b4 101101
    + *EXPERIMENTAL*: CSS function values using ``calc(...)`` should be partly parsable now (as experimental ExpressionValues currently)

    - BUGFIX: MS specific values are parsed a bit more reliable if parsing of these values is activated (they probable are syntactically invalid!). E.g. ``top: expression(eval(document.documentElement.scrollTop))`` and also a few values for the MS specific ``filter`` property are parsed and reserialized now.

    + IMPROVEMENT: ``CSSStyleSheet.variables`` now contains all available variable values (from all imported sheets as well as in sheet defined itself)



0.9.7b3 100620
    + API CHANGE: Changed parameters of script/utility function ``csscombine``.
            - parameter ``resolveVariables=True`` now (default was ``False`` before)
            - ``minify = True`` will not parse Comments at all. This is not really a change as comments were not kept in a minified stylesheet anyway but this may speed up stylesheet combination a bit

    + **PERFORMANCE/IMPROVEMENT**: Added parameter ``parseComments=True`` to CSSParser. If parsing with ``parser = cssutils.CSSParser(parseComments=False).parse...`` comments in a given stylesheet are simple omitted from the resulting stylesheet DOM.

    + **PERFORMANCE**: Compiled productions in cssutils tokenizer are cached now (to clear it use ``cssutils.tokenize2._TOKENIZER_CACHE.clear()``) which results in a slight performance improvement. Thanks to Amit Moscovich!


0.9.7b2 100606
    + IMPROVEMENT/BUGFIX: CSSFunction value parameters may contain HASH values like ``#fff`` now. These are used in experimental properties like ``-moz-linear-gradient(top,#fff,#fff 55%,#e4e4e4)``. Fixes Bitbucket #38.

    + API CHANGE: ``cssutils.ser.prefs.resolveVariables == True`` is the default from 0.9.7b2 as CSSVariables are not in any official specification yet and better reflects what you probably want after serializing a stylesheet...


0.9.7b1 100530
    + **API CHANGE**: Child objects like the ``cssRules`` of a ``CSSStyleSheet`` or ``CSSMediaRule`` are no longer kept after resetting the complete contents of an object (setting ``cssText``). This should not be expected anyway but if you relied on something like the following please beware::

            sheet = cssutils.parseString('a { color: red}')
            initial_rules = sheet.cssRules
            sheet.cssText = 'b { color: green}'
            # true until 0.9.6a6: assert sheet.cssRules == initial_rules, but now:
            assert sheet.cssRules != initial_rules

    + **IMPROVEMENT**: Massive speed improvement of handling of CSSVariables of a stylesheet which due to naive implementation was unbelievable slow when using a lot of vars... Should now scale a lot better, about factor 5-20 depending of amount of variables used.
    + IMPROVEMENT: Fair amount of refactoring resulting in a bit speed improvement generally too
    + CHANGE: If a CSS variable should be resolved (``cssutils.ser.prefs.resolveVariables == true``) but no value can be found a WARNING is logged now. Should be an ERROR actually but as currently lots of "fake" errors are reported would probably hurt more than help. A future release might improve this.
    + BUGFIX: Syntax of value of CSS Fonts Module Level 3 ``src`` property now validates if local font name is given with a quoted name, e.g.: ``src: local('Yanone Kaffeesatz')``


0.9.7a6 100523
    + **API CHANGE (major)**: When setting an objects ``cssText`` (or ``selectorText`` etc) property the underlying object is replaced with a new one now. E.g. if setting ``cssutils.css.CSSStyleRule.selectorText`` the underlying ``cssutils.css.CSSStyleRule.selectorList`` object is swapped to a new ``SelectorList`` object. This should be expected but cssutils until now kept the exact same object and changed its content *in-place*. Please be aware! (Also the strange ``_absorb`` method of some objects is gone which was used for this.)

    + **API CHANGE (minor)**: Renamed ``cssutils.ser.prefs.keepUnkownAtRules`` to ``cssutils.ser.prefs.keepUnknownAtRules`` due to misspelling, see Issue Bitbucket #37. A DeprecationWarning is issued on use.

    + API CHANGES (minor):
        - ``cssutils.css.CSSImportRule.media`` and ``cssutils.css.CSSMediaRule.media`` are now writable (setting with a string or ``cssutils.stylesheets.MediaList``)
        - msg level when setting ``cssutils.stylesheets.MediaList.appendMedium`` changed to INFO (was WARNING)
        - ``str(cssutils.css.CSSStyleRule)`` slightly changed

    - **IMPROVEMENT/BUGFIX**: Improved distribution: Egg release should no longer include the tests package, source release still should. Also added dependency package for tests (minimock) and removed documenation txt files from distribution (HTML still included of course). This also fixes Issue Bitbucket #36.

    - IMPROVEMENT: cssutils issues a warning if a page selector is not one of the defined in the spec (``:first``, ``:left``, ``:right``).

    - IMPROVEMENT: Refactored quite a lot and added a few tests for variables

0.9.7a5 100523
    - same changes as 0.9.7a6 but release was incomplete :(

0.9.7a4 100323
    - **API CHANGE**: ``CSSRule.NAMESPACE_RULE`` actual value has been changed from 8 to 10 (according to the change in the CSSOM spec). The actual integer values **SHOULD NOT** be used anyway! **Please do always use the ``CSSRule`` constants which are present in ALL CSSRule and subclass objects like CSSStyleRule, CSSImportRule etc.!**

    - **API CHANGE**: ``CSSStyleSheet.setSerializer`` and ``CSSStyleSheet.setSerializerPref`` have been DEPRECATED. Use ``cssutils.setSerializer(serializer)`` or set pref in ``cssutils.ser.prefs`` instead.

    - **IMPROVEMENT/CHANGE**: Did some minor changes to improve compliance to http://dev.w3.org/csswg/cssom
        + **MAJOR**: :class:`cssutils.css.CSSImportRule.styleSheet` always references a CSSStyleSheet now. ``parentStyleSheet`` of this sheet is ``None`` now
        + MINOR: added property ``alternate`` to :class:`cssutils.stylesheets.StyleSheet`, which for now is always ``False``
        + improved handling of encodings during imports (edge cases hopefully not found in the wild ;)

    + **FEATURE**: Started experimental implementation of `CSS Variables <http://disruptive-innovations.com/zoo/cssvariables/>`_

        **experimental and incomplete**

        Related details:

        - added ``cssutils.css.CSSStyleSheet.variables`` which is a :class:`cssutils.css.CSSVariablesDeclaration` containing all available variables in this CSSStyleSheet including the ones defined in imported sheets.
        - ``cssutils.ser.prefs.resolveVariables == False``: If set to ``True`` tries to resolve all variable references and removes any CSSVariablesRules.
        - ``cssutils.ser.prefs.normalizedVarNames==True``: Defines if variable names should be serialized normalized (they are used as being normalized anyway)

    + FEATURE: Added new options to ``cssutils.script.csscombine``:
        + ``cssText=None`` and ``href=None`` to start combination from a css string, which normally needs ``href`` to be able to resolve any imports.
        + ``resolveVariables=False`` which resolves any variables if given the value ``True``


    + DOCUMENTATION: Reordered and cleared docs up a bit

0.9.7a3 100314
    - **API CHANGE**: ``CSSRule.NAMESPACE_RULE`` actual value has been changed from 7 to 8 (according to the change in the spec). Also ``CSSRule.COMMENT`` has a value of ``1001`` (was ``-1``) and ``CSSRule.VARIABLES_RULE`` has a value of ``1008`` (was ``8``) now (being not in the official spec yet anyway but values are now in the open valuespace above 1000). The actual integer values **SHOULD NOT** be used anyway! **Please do always use the ``CSSRule`` constants which are present in ALL CSSRule and subclass objects like CSSStyleRule, CSSImportRule etc.!**

    + FEATURE: Added ``CSSRuleList.rulesOfType(type)`` which return and iterator the rules of the given type only. May be used on both ``CSSStyleSheet.cssRules`` or ``CSSMediaRule.cssRules``. ``type`` is one of the constants defined in ``css.CSSRule`` like e.g. ``css.CSSRule.STYLE_RULE``.

    + FEATURE (strange): IE specific values like ``DropShadow(color=#eee, offX=2, offY=1)`` (and ``Blur``, ``Shadow``) *should* be parsed and serialized now as an ``Expression`` value. I have not tested this deeply and there may be problems but for some common cases theses values should at least survive a parse/serialize with cssutils.

    - **BUGFIX/IMPROVEMENT**: Parser now handles FUNCTION values which themselves contain another FUNCTION as used by PrinceXML CSS like e.g. ``prince-link: target-counter(attr(href), page)``

0.9.7a2 091230
    - **API CHANGE**: Setting a style declarations' property to ``None`` or the empty string effectively removes this property from the declaration. See also Issue Bitbucket #32.

    + **BUGFIX/FEATURE**: Fixed Issue 33: URL references (like ``url()`` values) in combined sheets are now adjusted even if sheets are not in the same folder. Only relative paths are adjusted.

    - **BUGFIX**: Fixed parsing of FUNCTIONS in CSSUnknownRule like ``@bottom { counter(page) }`` which raised a false error of a mismatch of parenthesis

    + FEATURE: Added parameter ``ignoreImportRules=False`` to ``cssutils.replaceUrls`` which when set to ``True`` no longer reports URLs from @import rules but property values only (see Issue Bitbucket #33)

0.9.7a1
    - test release only

0.9.7a0
    - **API CHANGE**: Replaced init parameter and attribute ``css.Selector.parentList`` with ``css.Selector.parent``

    - API CHANGE (minor): Removed ``css.Property.parentStyle`` which was deprecated for some times now in favor of ``css.Property.parent``

    + **IMPROVEMENT**: Massive speed improvement due to changes in internal parsing.

      When tried in a real world situation (parsing the stylesheet for my own site inside a simple WSGI based CSS handler) the parser uses ~0.7-0.8s when using cssutils 0.9.6. With cssutils 0.9.7a0 it only needs ~0.21s so only about 1/3 to 1/4 the time...

    + FEATURE: Parameter `index` of ``CSSStyleSheet.deleteRule(index)`` and ``CSSMediaRule.deleteRule(index)`` may now also be a rule object to be removed from the contained cssRules list.

    - INTERNAL: Added ``tokenizer.push()``. Prodparser uses a global tokenizer now.


v0.9.6
======

0.9.6 091007
    + BUGFIX: Definition of macro for `positivenum` in cssutils profiles actually did allow nagative numbers, fixed (thanks to Jason R. Coombs)

    - distribution build with `distribute <http://pypi.python.org/pypi/distribute>`_ instead of setuptools

0.9.6b5 090830
    + BUGFIX: Issue Bitbucket #30 fixed. Setup from source did not work.

0.9.6b4 090829
    + BUGFIX: Issue Bitbucket #29 fixed. Double defined namespaces are replaced with a single (the last one) now.

    - IMPROVEMENT: ``cssutils.resolveImports`` now keeps media information when to be resolved @import rule uses these. It wraps the imported rules in an @media rule which uses the same media information from the @media rule in the original sheet.

      An xml.dom.HierarchyRequestErr may occur if an imported sheet itself contains @imports with media information or other rules which are not allowed in a @media rule like @namespace rules. In that case cssutils cannot resolve the @import rule and logs a WARNING but keeps the original @import.


0.9.6b3 090802
    + **FEATURE**: Added parsing support and new profile for details defined in module Fonts http://www.w3.org/TR/css3-fonts/
        + new properties: ``font-stretch``, ``font-size-adjust``
        + @font-face rules use a different profile for validation now which uses the defined properties only:
            - ``font-family font-style font-weight`` properties redefined
            - added ``src`` and ``unicode-range`` properties
        + Added ``CSSFontFaceRule.valid``. A @font-face rule is valid if all font descriptions properties are valid and properties ``font-family`` and ``src`` are set.

    + **FEATURE**: Added ``cssutils.parseStyle(cssText, encoding='utf-8')`` convienience function which assumes that the given `cssText` is the content of an HTML style attribute. It returns a :class:`~cssutils.css.CSSStyleDeclaration`.

    + **FEATURE** (experimental, request from Bitbucket #27): Added ``css.CSSStyleDeclaration.children()`` which is a generator yielding any known children of a declaration including *all* properties, comments or CSSUnknownRules.

    + FEATURE: ``CSSStyleDeclaration.insertRule`` also accepts a ``CSSRuleList`` now (same as ``CSSStyleSheet`` which does this for some time now).

    + FEATURE: Added ``CSSStyleDeclaration.keys()`` method which analoguous to standard dict returns property names which are set in the declaration.

    - **API CHANGE**: Replaced attribute ``css.Property.parentStyle`` with ``css.Property.parent`` (``parentStyle`` is DEPRECATED now).

    - API CHANGE: Added attribute ``parent`` to all CSSRules. It contains the Parent Node of this CSSRule (currently if a CSSStyleDeclaration only!) or None.

    - API CHANGE (minor): Removed parameter ``profiles`` from  ``cssutils.css.Property.validate()``. During validation each property checks which profiles to use which normally are all registered profiles in cssutils.profile. Exceptions are @font-face (TODO: and @page) rules which use their specific profile only. To add custom properties or values for the validation of these rules you need to add these to ``properties[Profiles.CSS3_FONT_FACE]`` in module ``cssutils.profiles`` and reregister that profile.

    + **BUGFIX**: Improved child and parent node referencing.
        - setting ``CSSStyleSheet.cssRules`` and ``CSSMediaRule.cssRules`` correctly update ``parentStyleSheet`` (and ``parentRule``) of contained rules now. Also settings ``cssRules`` should now work as expected.
        - setting ``css.CSSStyleRule.selectorList`` with a ``css.SelectorList`` object uses this new object directly
        - setting ``css.CSSStyleRule.style`` with a ``css.CSSStyleDeclaration`` object uses this new object directly
        - ``CSSStyleDeclaration.parentRule`` was not properly set for CSSStyleRule, CSSPageRule and CSSFontFaceRule.

    + **BUGFIX**: Parsing of CSSValues with unknown function names with a specific length of 4 or 7 chars were resulting in a SyntaxErr. Also parsing of comma separated list of CSS FUNCTION values works now.

    + BUGFIX: Fixed validation problems:
        - ``font-family: a   b`` (values with spaces in names without being quoted) are parsed now without emitting an ERROR. These are indeed valid but discouraged and you should use quotes (more than one space is compacted to a single space anyway so rather complicated without quotes)
        - negative lengths for the ``font-size`` property are now properly reported as ERRORs

    - IMPROVEMENT (minor): cssutils sets the HTTP header ``User-Agent`` now when fetching sheets over HTTP (with e.g. ``cssutils.parseUrl``).

    + CHANGES:
        - Refactored predefined ``Prod`` objects used for parsing of ``CSSValue``. Also added ``Predef.unicode_range`` and renamed ``CHAR`` to ``char``.
        - Removed css3productions which were only used for tests only anyway and which were not up to date at all

    - *FEATURE* (experimental): Added support to at least parse sheets with Microsoft only property values for ``filter`` which start with ``progid:DXImageTransform.Microsoft.[...](``. To enable these you need to set::

            >>> from cssutils import settings
            >>> settings.set('DXImageTransform.Microsoft', True)
            >>> cssutils.ser.prefs.useMinified()
            >>> text = 'a {filter: progid:DXImageTransform.Microsoft.BasicImage( rotation = 90 )}'
            >>> print cssutils.parseString(text).cssText
            a{filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=90)}
            >>>

      This currently is a **major hack** but if you like to minimize sheets in the wild which use this kind of CSS cssutils at least can parse and reserialize them.
      Also you cannot reset this change until you restart your program.

      These custom CSS FUNCTION names are not normalized at all. Also stuff like ``expression(...)`` which was normalized until now is not anymore.

0.9.6b2
    NO RELEASE

0.9.6b1 090609
    + BUGFIX: Fixed ``CSSPageRule.selectorText = ''`` which does reset the selector now

    + BUGFIX (minor): Removed false references in a few modules' ``__all__`` list

    - IMPROVEMENT: Jython 2.5 (from RC4) runs all tests now but a few changes had to be done:
        - exception messages sometimes do have a different format in Jython and Python (but also between Python versions >= 2.5 and < 2.4 ...)
        - Jython's ``xml.dom.Exception`` misses attribute ``args`` it seems

0.9.6a4 090509
    - **API CHANGE**: Reverted handling of exceptions (Bitbucket #24) as this did not work with PyXML installed. You may again use ``str(e)`` on any raised xml.dom.Exception ``e``. Since 0.9.6a0 exceptions raised did raise a tuple of message, line and col information. Now the message alone is raised (again). Line and col information is still available as ``e.line, e.col``.

    + BUGFIX: Fixed Bitbucket #22 parsing or actually reserializing of values like ``content: "\\"``

    + BUGFIX: All examples at http://www.w3.org/TR/2009/CR-CSS2-20090423/syndata.html#illegalvalues should work now as expected:
        - Unknown ATKEYWORD tokens in selectors make these invalid now, see example : ``p @here {color: red}``
        - completion of incomplete @media rule like ``@media screen { p:before { content: 'Hello`` does work now when parsing with a non raising parser

    - **FEATURE**: Updated some parts to http://www.w3.org/TR/2009/CR-CSS2-20090423/changes.html#new (most changes decribed there were already done in cssutils)
        + updated tokenizer macro ``escape``
        + replaced media ``aural`` with ``speech``
        + property ``content`` has allowed value ``none`` now
        + property ``background-position`` allows mixed values like ``left 10%`` now

    - **FEATURE**: New preference option ``keepUnkownAtRules = False`` which defines if unknown atrules like e.g. ``@three-dee {...}`` are kept or not. Setting this pref to ``False`` in result removes unknown @rules from the serialized sheet which is the default for the minified settings.

    - **IMPROVEMENT**: Fixed Bitbucket #23. The examples/style.py example renderer was reusing ``Property`` objects for each HTML element so they effectively overwrote each other.

    + DOCUMENTATION: Using Sphinx 0.6.1 now


0.9.6a3 090426
    - **IMPROVEMENT**: Fixed ``CSSStyleDeclaration.length`` for Python 2.6.2 (due to a backport from Python 2.7 to 2.6.2 the reversed() iterator has no __length__ anymore which cssutils was using)

    + **BUGFIX**: New version of encutils (0.9) with these fixes:
        - invalid HTML (like ``< />``) does not stop the encoding detection anymore
        - fixed ``tryEncodings`` if chardet is not installed
        - mismatch is ``False`` now if mime-type is ``text/xml`` (or similar) and XML encoding pseudo attribute defines encoding as this is ignored completely!
        - default encoding for CSS is UTF-8 now if not other HTTP info is given. @charset encoding information is **not** used by encutils!
        - log output for mismatch uses ``!=`` instead of ``<>`` now
        - fixed testcases which were not all tested :(most embarrassing)

    + **BUGFIX**: Fixed Bitbucket #21 http://code.google.com/p/cssutils/issues/detail?id=21. Definition of valid values for property `background-position` was wrong. Still mixed values like ``background-position: 0 top`` are invalid although most browsers accept them. But the CSS 2.1 spec defines it the above way. CSS3 backgrounds is not implemented yet in cssutils.


0.9.6a2 090308
    + **API CHANGE**: :class:`cssutils.profiles.Profiles` (introduced in 0.9.6a1) has been refactored:

        - ``cssutils.profile`` (a ``cssutils.profiles.Profiles`` object) is now preset and available used for all validation
        - moved variable ``cssutils.profiles.defaultprofile`` to attribute ``Profiles.defaultProfiles`` (and so also available as ``cssutils.profile.defaultProfiles``)
        - renamed ``Profiles.CSS_BOX_LEVEL_3`` to ``Profiles.CSS3_BOX`` and ``Profiles.CSS_COLOR_LEVEL_3`` to ``Profiles.CSS3_COLOR``
        - renamed ``Profiles.basicmacros`` to ``Profiles._TOKEN_MACROS`` and ``Profiles.generalmacros`` to ``Profiles._MACROS``. As these two are always added to your property definitions there is no need to use these predefined macro dictionaries in your code.
        - renamed ``Profiles.knownnames`` to ``Profiles.knownNames``
        - ``Profiles.validateWithProfile`` returns ``valid, matching, profiles`` now
        - renamed named parameter in :meth:`cssutils.css.Property.validate(profiles=None)` from ``profile`` to ``profiles``
        - ``cssutils.profiles.properties`` (and new ``cssutils.profiles.macros``) use as keys the predefined constants in Profiles, like e.g. ``Profiles.CSS_LEVEL_2`` now. If you want to use some of the predefind macros you may e.g. use ``cssutils.profiles.macros[Profiles.CSS_LEVEL_2]['family-name']`` (in addition to the always available ``Profiles._TOKEN_MACROS`` and  ``Profiles._MACROS``).

    + **CHANGE**: Reporting levels of properties have changed. Please see :meth:`cssutils.css.Property.validate` for details. E.g. valid properties in the current profile are only reported on DEBUG and not INFO level anymore. The log output has been changed too, context information is provided now (line, column and name of the relevant property)

    - FEATURE: Added new properties as profile ``Profiles.CSS3_PAGED_MEDIA``: *fit*, *fit-position*, *image-orientation*, *page*, *size* and relevant properties already defined in ``Profiles.CSS_LEVEL_2``

    + **BUGFIX**: ``p.valid == False`` is now set for Properties not valid in the current profile even if they are valid in a different profile
    + **BUGFIX**: Macros used when adding a new profile to ``cssutils.profile`` were polluted with ALL macros ever defined. They now correctly use the (always used) predefined macros ``Profiles._TOKEN_MACROS`` and ``PROFILES._MACROS`` in addition to the given macros (``cssutils.profile.addProfile(self, profile, properties, macros=None)``) only. If you want to use any macros defined in other profiles you need to add these to your own macros as seen in ``macros[Profiles.CSS3_BOX]``.
    + BUGFIX: If ``cssutils.ser.prefs.validOnly == True`` serializer incorrectly put a single ``;`` for invalid properties out until now.

    - **IMPROVEMENT**: comments added by ``cssutils.resolveImports`` only use the @import rules' href and not the absolute href of the referenced sheets anymore (might have been a possible security hole when showing a full local path to a sheet in a combined but not minified sheet)

    - IMPROVEMENT: IE specific `alpha` values like ``filter: alpha(opacity=80)`` are parsed and kept now.


0.9.6a1 090207
    - **API CHANGE**: Known but invalid properties raise/log an ERROR instead of a WARNING now. Properties not expected in the current profile log an INFO. As the default profile is ``None`` even basic properties like ``color`` are logged now. You may want to change the default profile by setting e.g. ``cssutils.profiles.defaultprofile = cssutils.profiles.Profiles.CSS_LEVEL_2`` (~ CSS 2.1) to prevent CSS 2.1 properties to be reported. Also other validation related output has been slightly changed.

        **The way to change a defaultprofile may change again.**

    - **API CHANGE**: ``cssutils.script.csscombine`` has **ONLY** keyword parameters now. Use ``csscombine(path=path[,...])`` for the old behaviour. New parameter ``url`` combines the sheet at URL now.

    + **FEATURE**: Added **experimental** profiles handling. You may add new profiles with new properties and their validation and set a defaultprofile used for validation. The current default profile is ``None`` so all predefined profiles are used. Currently 3 profiles are defined:

      :attr:`~cssutils.profiles.Profiles.Profiles.CSS_LEVEL_2`
            Properties defined by CSS2.1
      :attr:`~cssutils.profiles.Profiles.Profiles.CSS_COLOR_LEVEL_3`
            CSS 3 color properties
      :attr:`~cssutils.profiles.Profiles.Profiles.CSS_BOX_LEVEL_3`
            Currently overflow related properties only

      See the docs and source of the cssutils.profiles module for details.

    + **FEATURE**:  ``cssutils.util._readUrl()`` allows fetchers to pre-decode CSS content and return `unicode` instances, with or without a specified source encoding (integrated from patch of Issue Bitbucket #19).

    + **FEATURE**: URL fetch method checks if cssutils is run in GoogleAppEngine (GAE) (if ``import google.appengine`` is successful) and uses the GAE fetch methods instead of urllib2 in that case. So in result cssutils should run on GAE just as elsewhere.
    + **FEATURE**: Function ``cssutils.resolveImports(sheet)`` returns a new stylesheet with all rules in given sheet but with all @import rules being pulled into the top sheet.
    + FEATURE: CSSCombine script and helper function resolve nested imports now.
    + FEATURE: Script ``csscombine`` has new option ``-u URL, --url=URL     URL to parse (path is ignored if URL given)`` now

    + BUGFIX: Other priority values than ``!important`` are parsed now. Nevertheless they log an ERROR or raise a SyntaxErr.
        **TODO**: Preference setting. Profile?

    - IMPROVEMENT: Added all known properties (by cssutils ;) to CSS2Properties.

    + DOCUMENTATION: Changed documentation generation from Epydoc and home grown HTML generation to Sphinx. Not all is perfectly markup'd yet but not too bad either...



0.9.6a0 081214
    + **FEATURE**: ``xml.dom.DOMException``\ s raised do now contain infos about the position where the exception occured. An exception might for example have been raised as::

        raise xml.dom.SyntaxErr('the message', 10, 5)

      (where 10 is the line and 5 the column of the offending text).

      Therefor you may **not** simply use ``str(e)`` to get the exception message but you have to use ``msg, line, col = e.args[0], e.args[1], e.args[2]``. Additionally exceptions raised have attributes ``e.line`` and ``e.col``.

    + **FEATURE**: @page rule accepts named page selector now, e.g. ``@page intro`` or ``page main:left``.

    + **FEATURE**: Script ``cssparse`` has new option ``-u URL`` which parses the given URL.

    + **FEATURE**: Started implementation of CSS profiles...
        - moved ``cssutils.css.cssproperties.cssvalues`` to ``cssutils.profiles.css2``
        - added CSS Color Module Level 3 with properties ``color`` and ``opacity``. Not implemented are SVG color names.
        - unknown properties raise a WARNING instead of INFO now
        - refactored CSSValue and subclasses therefore there may be some minor changes in serializing or value reporting
            + ``getStringValue()`` returns a string without quotes or for URIs a value without surrounding ``url(...)`` now

    + FEATURE **experimental**: Added class ``CSSColor`` which is used for RGB, RGBA, HSL, HSLA and HEX color values of ``CSSValue`` respective ``CSSPrimitiveValue``.

    + FEATURE (strange): IE only CSS expressions *should* be parsed and serialized now an an ``Expression`` value. I have not tested this deeply and there may be problems but for some common cases this should work, e.g. for hacking maxwidth for IE you may define the following::

        width: expression(document.body.clientWidth > 1000 ? "1000px": "100%")

      Usage of CSS expressions is strongly discouraged as they do not validate AND may slow down the rendering and browser quite a lot!

    + BUGFIX/IMPROVEMENT: rewrite of CSSValue and related classes
        - BUGFIX: Parsing of a CSSValue like ``red /**/`` (value, Space, comment) fixed.
        - BUGFIX: Parsing values with ``+`` operator fixed.
        - BUGFIX: ``CSSValueList.__str__`` added (missing last underscore rendered it useless)
        - IMPROVEMENT: Serializing e.g. ``rgb(0,0,0)`` now defaults to ``rgb(0, 0, 0)``
        - IMPROVEMENT: HEX values are minified if possible, e.g. ``Bitbucket #112233`` results in ``Bitbucket #123``
        - IMPROVEMENT: Improved handling of zero lengths like ``-0, 0.0, .0mm`` etc all should come out simply as ``0`` now
        - IMPROVEMENT: number values are normalized now, e.g. ``010.0px`` results in ``10px`` etc
        - IMPROVEMENT: DIMENSIONs are normalized now, e.g. ``1pX`` results in ``1px``
        - IMPROVEMENT: for CSSValueList values like e.g. ``margin: 0 1px`` there are no more false WARNINGs emitted
        - IMPROVEMENT: Comments should be parsed much better now
        - IMPROVEMENT: ``CSSValue.getFloattype(unitType=None)``, parameter is now optional in which case the current dimension is used.
        - fixed lots of other minor bugs related to CSSValue

    - **BUGFIX**: Fixed tokenizing/parsing of rather strange STRING and URI values like:
        - Valid::

            "somestring followed by escaped NL\
             and continuing here."

          and now results in::

            "somestring followed by escaped NL and continuing here."

        - ``url())`` => not allowed and must be written as ``url(")")``

    - **BUGFIX**: Setting ``CSSPageRule.selectorText`` does actually work now.

    - BUGFIX: Other priority values than ``!important`` are parsed now. Nevertheless they log an ERROR or raise a SyntaxErr.

    - BUGFIX: Fixed Issue Bitbucket #14, added ``CSSStyleDeclaration().borderLeftWidth``. But prefer to use ``CSSStyleDeclaration()['border-left.width']``.

    + **API CLEANUP**:
        - moved validating of a property from ``CSSValue`` to ``Property``
        - removed ``CSSValue.valid`` as it does not make sense anymore
        - removed private init parameter ``CSSValue_propertyName``
        - private attribute ``CSSValue._value`` contains ``(value, type)`` now. Do not use as it may change again
        - removed ``Property.normalname`` (DEPRECATED from 0.9.5 ), use ``Property.name`` instead
        - removed long deprecated ``CSSStyleSheet.replaceUrls``, use ``cssutils.replaceUrls()`` instead
        - ``cssutils.utils.Base`` and ``cssutils.utils.Base2`` have been changed and will be removed in favor of new ``cssutils.utils._NewBase``. These are all internal helper classes and should not be used in client code anyway but ye be warned...

    + IMPROVEMENT:
        - minor changes due to deprecation in Py3k. cssutils is NOT Py3k compliant yet though and it will probably take a while until it will be...



v0.9.5
======

0.9.5.1 080811
    + **BUGFIX**: Fixed parsing of ``}a,b`` which resulted in TypeError until now.

    + **BUGFIX**: A rule with a selector using an undefined and therefor invalid namespace prefix is ignored now.

    + **BUGFIX**: Removed typo in MediaList which resulted in Exception when parsing medialist containing ``all`` and another media.

    + **BUGFIX**: Reading imported styles may have failed under certain conditions with an AttributeError.

    + FEATURE: Added ``cssutils.VERSION`` which is the current release version, in this case e.g. ``"0.9.5.1"``

    + IMPROVEMENT: Optimized imports and partly removed circular ones which are a bit tricky...

0.9.5 080730
    + **API CHANGE**: If a new medium is trying to be appended to a ``MediaList`` already set to ``all`` an ``xml.dom.InvalidModificationErr`` is raised. The exception to this handling is adding ``handheld`` which is a special case for Opera and kept for now. This special handling may be removed in the future. A ``WARNING`` is logged in any case.

    - **BUGFIX**: Fixed reference error in @import rule preventing change of the used ``MediaList``.
    - **BUGFIX**: Deeply nested ``CSSImportRule``\ s with different encodings  should keep the encoding as defined (via HTTP, parendSheet, @charset etc) now.  Therefor ``cssutils.util._readUrl`` does return ``(encoding, enctype, decodedCssText)`` now where ``enctype`` is a number from 0 to 5 indicating which encoding type was used: 0 for encoding override, 1 for HTTP encoding, 2 for BOM or @charset rule, (3 is unused currently), 4 for encoding of the parent sheet and 5 if encoding defaults to UTF-8 as no other information is available. (This may later be done as constants but this function should not be used from programs generally).
    - **BUGFIX**: Replaced usage of ``WindowsError`` with ``OSError``. I (naively ;) thought ``WindowsError`` at least be present in environments other than Windows but it just results in a ``NameError``... The part of the API which triggered this Exception is an @import rule with an invalid or local (file) URI so should have happened quite rarely anyway.

    + IMPROVEMENT: Standalone scripts ``csscombine`` and ``csscapture`` are available for programmatic use in ``cssutils.script.csscombine`` and ``cssutils.script.CSSCapture`` res.
    + IMPROVEMENT: ``cssutils.script.csscombine`` and ``csscombine`` script do use the cssutils log now instead of just writing messages to ``sys.stderr``
    + IMPROVEMENT: Optimized and refactored tokenizer (CHARSET_SYM).

0.9.5rc2 080714
    - **API CHANGE/BUGFIX (major)**:

        Upto 0.9.5rc1 any sheet resulting from parsing via any ``parse*`` function or ``CSSParser(raiseExceptions=False)`` (which also was and is the default) resulted in the library simply logging any later exceptions and not raising them. Until now the global setting of ``cssutils.log.raiseExceptions=True`` (the default) was overwritten with the value of the CSSParser ``raiseExceptions`` setting which normally is ``False`` any time a ``cssutils.parse*`` function or ``CSSParser.parse*`` method was used. 0.9.5rc2 fixes this.

        until 0.9.5rc1::

            >>> # parsing does not raise errors
            >>> s = cssutils.parseString('$') # empty but CSSStyleSheet object

            >>> # using DOM methods does **not raise either** but should:
            >>> s.cssText = '$' # just logs:
            ERROR   CSSStyleRule: No start { of style declaration found: u'$' [1:2: ]

        from 0.9.5rc2::

            >>> # parsing STILL does not raise errors
            >>> s = cssutils.parseString('$') # empty but CSSStyleSheet object

            >>> # using DOM methods **does raise now though**
            >>> s.cssText = '$' # raises:
            xml.dom.SyntaxErr: CSSStyleRule: No start { of style declaration found: u'$' [1:1: $]

        To use the old but false behaviour add the following line at the start to your program::

            >>> cssutils.log.raiseExceptions = False # normally True

        **This should only be done in specific cases** as normal raising of exceptions in methods or functions with the CSS DOM is the expected behaviour. **This setting may also be removed in the future so use with care.**

    - **BUGFIX**: Parsing of @rules like ``@mediaall ...`` does not result in ``@media all ...`` anymore (so not a ``CSSMediaRule``) but parses as  ``@mediaall`` so a ``CSSUnknownRule``. The specification is not too clear here but it seems this is the way to go. To help finding typos like this probably is, for any found CSSUnknownRule (an unknown @rule) a WARNING is emitted now (but never an exception raised). These typos will most likely happen like e.g. ``@mediaall``, ``@importurl()``, ``@namespaceprefix"uri"`` or ``@pagename:left``.

    - **BUGFIX**: Parsing of unicode escapes like ``\\abc`` followed by CR/LF this is now correctly combined as only a single whitespace character.

    - **BUGFIX**: Adding a malformed ``stylesheets.MediaQuery`` to a ``stylesheets.MediaList`` does fail now, e.g.::

            >>> # invalid malformed medialist (missing comma):
            >>> sheet = cssutils.parseString('@media tv INVALID {a {top: 0;}}')
            ERROR   MediaQuery: Unexpected syntax. [1:11: INVALID]
            ERROR   MediaList: Invalid MediaQuery:  tv INVALID
            >>> # the actual rule exists but has default empty content, this may be
            changed later as it can be seen as a bug itself
            >>> sheet.cssRules[0]
            cssutils.css.CSSMediaRule(mediaText=u'all')
            >>> sheet.cssText
            ''

            >>> # BUT: Unknown media type but as it is valid does parse:
            >>> sheet = cssutils.parseString('@media tv, UNKNOWN {a {top: 0;}}')
            WARNING MediaQuery: Unknown media type "UNKNOWN".
            >>> sheet.cssRules[0]
            cssutils.css.CSSMediaRule(mediaText=u'tv, UNKNOWN')
            >>> sheet.cssText
            '@media tv, UNKNOWN {\n    a {\n        top: 0\n        }\n    }'

    - **BUGFIX**: References to ``MediaList`` in ``CSSImportRule`` and ``CSSMediaRule`` are kept now properly.

    - BUGFIX: Deleting a ``MediaQuery`` item from a ``MediaList`` does use the libs logging/raising settings instead of always raising

    - **IMPROVEMENT**: Parsing performance has been improved (by about 25%, tested with a basic CSS of about 50 lines, so may not be representative but this release definitely is faster ;). The following changes have been done which should not impact any actual stylesheet:

        + A ``BOM`` token is recognized at the start of a stylesheet only (may be swallowed by the CSS codec anyway).
        + A ``BOM`` token is not counted in the line/col reporting anymore so the following token has a line and col of 1 now
        + Tests for tokenizing with css2productions has been removed but this is never used in the library anyway


0.9.5rc1 080709
    - **API CHANGE/FEATURE**: ``The cssutils.log`` may be partly used like a standard logging log. The following methods are available: ('setLevel', 'getEffectiveLevel', 'addHandler', 'removeHandler') as well as all "messaging" calls like 'error', 'warning' etc.

      Therefor ``cssutils.log.setloglevel`` has been *DEPRECATED* and should be used via ``cssutils.log.setLevel``. The old method is still available though.

      ``cssutils.log.setlog`` has been renamed to ``cssutils.log.setLog`` but is still available but *DEPRECATED* too.

    - **FEATURE**: All three decoders in the codec now have an additional ``force`` argument. If ``force`` is false, the encoding from the input will only by used if is is detected explicitely via BOM or @charset rule.

    - **FEATURE**: ``cssparse`` script has new option ``-m --minify`` which results in the parsed CSS to be serialized minified

    - **FEATURE**: ``CSSCapture`` and ``csscombine`` are now available not only as standalone scripts but also via ``cssutils.script.CSSCapture`` and ``cssutils.script.csscombine`` repectively so you can use them programmatically now.

    - **BUGFIX**: A space after @rule keyword is added when serializing minified something like ``@media all{}``. Until now it was ``@mediaall{}`` which is recognized by Safari only but probably is not valid at all. Other @rules behave similar now too.

    - **BUGFIX**: Properties of rules set via ``css.CSSStyleSheet.add`` or ``.insert`` were not set properly, e.g. ``parentStyleSheet`` or the stylesheet handling of new @import rules was buggy.

    - BUGFIX: Encountering OSError during resolving @import does not throw an error anymore but the resulting CSSImportRule.styleSheet will have a value of ``None``. OSError will probably only happen when using ``parseFile``.

    - **IMPROVEMENT/BUGFIX**: A style sheet with ``href == None`` (e.g. parsed with ``parseString()`` or build completely from scratch) uses ``os.getcwd()`` as its base href now to be able to resolve CSSImportRules.

    - **IMPROVEMENT/BUGFIX**: Rewrote ``csscombine`` script which should be much more stable now and handles namespaces correctly. Nested imports are still not resolved yet but this may come in the next release.

    - IMPROVEMENT/BUGFIX: Added catching of WindowsError to default fetcher (e.g. is a file URL references a file not present).

    - **CHANGE/BUGFIX**: Redone ``csscapture`` script. A few minor method changes (parameter ``ua`` of ``capture`` has been replaced by init parameter) and lots of internal improvement has been done.

    - CHANGE: ``CSSStyleSheet.add(rule)`` simply appends rules with no specific order in the sheet to the end of it. So e.g. COMMENTs, STYLE_RULEs, etc are appended while rules with a specific place are ordered-in as before (e.g. IMPORT_RULE or NAMESPACE_RULE). Until now rules of a specific type like COMMENTs were ordered together which does not really make sense. The ``csscombine`` script needs this functionality and the resulting combined sheets should be more readable and understandable now.

    - CHANGE: Default URL fetcher emits an ERROR instead of a warning if finding a different mine-type than ``text/css``.

0.9.5b3 080605
    - **API CHANGE**: ``parse()`` is *DEPRECATED*, use ``parseFile()`` instead. I know this should not happen in a release already in beta but better now than later and currently both ways are still possible.

    - **FEATURE**: CSSStyleDeclatation objects may be used like dictionaries now. The value during setting a property may be a single value string or a tuple of ``(value, priority)``::

            >>> style = css.CSSStyleDeclaration()
            >>> style['color'] = 'red'
            >>> style.getProperties()
            [cssutils.css.Property(name='color', value=u'red', priority=u'')]
            >>> del style['color']
            >>> style['unknown'] = ('value', 'important')
            INFO    Property: No CSS2 Property: 'unknown'.
            >>> style.getProperties()
            [cssutils.css.Property(name='unknown', value=u'value', priority=u'impor
            tant')]
            >>> del style['never-set'] # does not raise KeyError but returns u'' like removeProperty()
            >>>

    - **FEATURE**: While reading an imported styleSheet all relevant encoding parameters (HTTP headers, BOM/@charset, etc) are used now as defined in http://www.w3.org/TR/CSS21/syndata.html#charset

        Additionally a given parameter ``encoding`` for ``parseString``, ``parseFile`` and ``parseUrl`` functions/methods **overrides** any detected encoding of read sheet like HTTP information or @charset rules. Useful if e.g. HTTP information is not set properly. The given ``encoding`` is used for **all** imported sheets of the parsed one too! This is a cssutils only addition to the rules defined at http://www.w3.org/TR/CSS21/syndata.html#charset.

    - **FEATURE**: A custom URL fetcher may be used during parsing via ``CSSParser.setFetcher(fetcher)`` (or as an init parameter). The so customized parser is reusable (as all parsers are). The fetcher is called when an ``@import`` rule is found and the referenced stylesheet is about to be retrieved.

      The function gets a single parameter

      ``url``
          the URL to read

      and MUST return ``(encoding, content)`` where ``encoding`` normally is the HTTP charset given via a Content-Type header (which may simply omit the charset though) and ``content`` being the (byte) string content. The Mimetype of the fetched ``url`` should be ``text/css`` but this has to be checked by the fetcher itself (the default fetcher emits an ERROR (from 0.9.5 before a WARNING)  if encountering a different mimetype).
      The content is then decoded by cssutils using all encoding related data available.

        Example::

            def fetcher(url):
                return 'ascii', '/*test*/'

            parser = cssutils.CSSParser(fetcher=fetcher)
            parser.parse...

      To omit parsing of imported sheets just define a fetcher like ``lambda url: None`` (A single None is sufficient but returning ``(None, None)`` is more explicit).

      You might also want to define an encoding for each imported sheet with a fetcher which returns a (normally HTTP content-type header) encoding depending on each URL.

    - **FEATURE**: Added option ``-s --string`` to cssparse script which expects a CSS string to be parsed.

    - **FEATURE/BUGFIX**: Parsing of CSSStyleDeclarations is improved. Invalid ``/color: red;color: green`` is now correctly parsed as ``color: green`` now. At the same time the until now parsed but invalid ``$color: red`` (an IE hack) is not parse anymore but correctly dismissed!

      Unknown rules in CSSStyleDeclaration are parsed now. So e.g ``@x; color: red;`` which is syntactically valid is kept completely.

    - **BUGFIX**: ``parseUrl`` does return ``None`` if an error occurs during reading the given URL. Until now an empty stylesheet was returned.

    - **BUGFIX**: Fixed parsing of values like ``background: url(x.gif)0 0;`` (missing space but still valid).

    - BUGFIX: Serializing CSSUnknownRules is slightly improved, blocks are correctly indentet now.

    - **LICENSE**: cssutils is licensed under the **LGPL v3** now (before LGPL v2.1). This should not be a problem I guess but please be aware. So the former mix of LGPL 2.1 and 3 is resolved to a single LGPL 3 license for both cssutils and the included encutils.

    - INTERNAL: Moved tests out of cssutils main package into a tests package parallel to cssutils.

0.9.5b2 080323
    - **API CHANGE**: ``cssutils.parseURL`` has been renamed to ``parseUrl`` for consistency with ``getUrls`` or ``replaceUrls``. Parameter ``href`` (before called ``url``) is the first and mandatory parameter now.

    + **BUGFIX**: Fix the streamreader in the codec: Honor the encoding if one is passed to the constructor instead of trying to detect it from the stream.

    + **BUGFIX**: Reading referenced styleSheet in CSSImportRule did not succeed as no encoding information is passed along. Encoding of referenced sheets is always retrieved via HTTP or from imported sheet itself. Fixed lots of unchecked cases and simplified exception handling when reading a referenced sheet.

    + BUGFIX: Setting ``atkeyword`` of @rules checks if it is a valid keyword for the specific rule. E.g. an @import rule accepts ``@im\port`` but not ``@namespace``.
    + BUGFIX: Fixed setting ``name`` of CSSImportRule. Setting ``name`` other than with a string results in xml.dom.SyntaxErr raised now
    + BUGFIX: ``CSSStyleSheet.type`` with a fixed value of "text/css" and other readonly properties are really readonly now

    - IMPROVEMENT: Added media information to ``__str__`` and ``__repr__`` or CSSStyleSheet.
    - IMPROVEMENT: Added more information to ``__repr__`` of CSSImportRule.
    - IMPROVEMENT: Added ``__repr__`` for ``cssutils.util._SimpleNamespaces`` which is used in a selector repr.

0.9.5b1 080319
    - **API CHANGE**: ``cssutils.css.CSSSStyleSheet.replaceUrls(replacer)`` has been **DEPRECATED** but is available as an utility function so simply use ``cssutils.replaceUrls(sheet, replacer)`` instead. For the why see ``getUrls(sheet)`` below.

    - **API CHANGE/FEATURE**: ``parseString`` has a new parameter ``encoding`` now which is used if a ``str`` is given for cssText. Otherwise it is ignored. (patch by doerwalter)

    - API CHANGE/FEATURE: ``.parse() .parseString()`` and constructor of ``CSSStyleSheet`` have a new parameter ``title`` needed for the cascade (yet to be implemented ;).

       Also the representation of ``CSSStyleSheet`` has been improved.

    + **FEATURE**: Referenced stylesheet in an @import rule is read and parsed now if possible. Therefor the ``href`` given during parsing (parameter ``href`` to the ``parse*`` functions is used. It is also properly set on imported rules. The ``name`` property of the @import rule is set as the imported sheets ``title`` property.

    + **FEATURE**: Added ``cssutils.getUrls(sheet)`` utility method to get all ``url(urlstring)`` values in ``CSSImportRules`` and ``CSSStyleDeclaration`` objects (properties). As this function and the above mentioned ``replaceUrls(sheet, replacer)`` are useful not only for a single sheet but (later) also for a stylesheet list they are not methods of CSSStyleSheet anymore (also because they are not part of the official DOM spec). (patch by doerwalter)

    + FEATURE: Added ``cssutils.parseURL(url, encoding=None, ...)``

    + BUGFIX: Fixes Issue Bitbucket #10, using full ``$LastChangedDate$`` in source files breaks code for some locales. Now only in a few files this svn:keywords replacement is used and only to a fixed length without the problematic part. In all other files ``$Id$`` is used which also includes simple but sufficient date information.

    + **BUGFIX/IMPROVEMENT**: Handling of trailing content, WS and comments in rules should be more consistent and properly handled now, added tests. Exception is ``CSSCharsetRule`` where no comments are allowed at all.

    - TESTS: **Tests need ``minimock`` now!** Install with ``easy_install minimock``

    + DOCUMENTATION: Improved docs a bit.

    - **LICENSE**: The included `encutils <http://cthedot.de/encutils/>`__ has been updated to version 0.8.2 with a compatible LGPL license. `restserver.py <http://cthedot.de/restserver/>`__ has been updated to version 2.1 which is in the public domain now (no Creative Commons license anymore). So only a single license (the LGPL) is used throughout cssutils now. If you have other licensing needs please let me know.


0.9.5a4 080222
    - **API CHANGE**: ``.wellformed`` replaces ``.valid`` for most classes. This is more an internal value so should be used carefully anyway. Some classes still have both, notably ``Property`` and ``CSSValue``. Also removed ``Preferences.removeInvalid`` which was deprecated for some time now and made not really sense anyway.

    - API CHANGE: Removed ``cssutils.ser.prefs.wellformedOnly`` which made no sense at all. It probably was not used in client code anyway. cssutils serializes wellformed (not necessarily valid) stylesheets only (hopefully ;).

    - API CHANGE: Removed constructor parameter ``css.CSSImportRule(hreftype=...)`` which made no sense really. The type of href is still retained if ``css.CSSImportRule.cssText`` is set (e.g. for ``@import "a-str";`` it is "string" and for ``@import url(an-uri);`` it is "uri". How it is serialized is defined in the serializer anyway (``cssutils.ser.prefs.importHrefFormat`` "string", "uri" or None which then uses the one in each @import rule or defaults to "uri") so it made no sense to have it hear too. It still may be used but generally should not.

    + **FEATURE**: Defining a namespace with a prefix but an empty namespaceURI is not allowed in XML 1.0 (but in XML 1.1). It is allowed in CSS and therefor also in cssutils.

      **ATTENTION**: CSS differs from XML 1.0 here!

    + **FEATURE**: Added property ``css.CSSImportRule.name`` and ``css.CSSMediaRule.name`` as decribed in http://www.w3.org/TR/css3-cascade/#cascading. It is parsed, serialized and available in this new property now. Property ``name`` is a constructor parameter now too.

    + **FEATURE**: ``css.UnknownRule`` is now parsed properly and checked for INVALID tokens or if {}, [] or () are not nested or paired properly. CSSUnknownRule is removed from CSSOM but in cssutils it is and will be used for @rules of programs using extensions, e.g. PrinceXML CSS. It is not very usable yet as no actual properties except ``atkeyword``, ``cssText`` and ``seq`` are present but at least it is syntactically checked properly and I hope serialized similar to other rules. This has been completely rewritten so may contain a few bugs so check your serialized sheets if you use non-standard @rules.

    - **BUGFIX**: Improved escaping. Fixed cases where e.g. an URI is given as ``url("\"")``. Also escapes of delimiters in STRINGs is improved. This is used by ``CSSImportRule`` or ``CSSNamespaceRule`` among others. All STRING values are serialized with ``"..."`` (double quotes) now. This should not be a problem but please note that e.g. a ``CSSValue`` may be slightly different now (but be as valid as before).

    - **BUGFIX**: Fixed serialization of namespaces in Selector objects. Actually all possible namespaced selectors should be preserved now:

        ``*``
            any element or if a default namespace is given any element in that namespace
        ``a``
            all "a" elements or if a default namespace is given "a" elements in that namespace
        ``|*``
            any element in the no namespace (the *empty namespace*)
        ``|a``
            "a" elements in the no namespace (the *empty namespace*)
        ``*|*``
            any element in any namespace including the no namespace
        ``*|a``
            "a" elements in any namespace including the no namespace
        ``p|*``
            any element in the namespace defined for prefix p
        ``p|a``
            "a" elements in the namespace defined for prefix p

    - **BUGFIX**: Default namespace is no longer used by attribute selectors.

    + CHANGE: ``CSSNamespaceRule`` implements http://dev.w3.org/csswg/css3-namespace/ now. Giving the namespaceURI as an URI token (``url("uri")``) is no longer deprecated so no warning is emitted any longer.

    - IMPROVEMENT: Started refactoring rules to have ``wellformed`` property and serializing included comments better.

    - IMPROVEMENT: Added simple testtool for functional tests in /examples plus lots of smaller bugfixes, improvements and refactorings

0.9.5a3 080203
    - **API CHANGE: Refactored and fixed namespace handling**
        Aim was to prevent building invalid style sheets. therefor namespaces must be checked e.g. when adding a new ``Selector`` etc. This probably is not fixed for all cases but much better now than before.

        - added ``CSSStyleSheet.namespaces`` which is a mapping of ``prefix: namespaceURI`` and mirrors all namespaces as defined in @namespace rules. New Namespaces may also be set here as well as prefixes changed.
        - if more than one ``CSSNamespaceRule`` with the same ``namespaceURI`` is set only the last one will be kept. The ``prefix`` of that rule is used.
        - ``CSSNamespaceRule.namespaceURI`` is readonly now, it can only be set in the constructor (needed to prevent an invalid sheet when changing this uri)
        - Namespaces used in a Selector or SelectorList or even a CSSStyleRule while these are not attached to a CSSStyleSheet (which would contain the necessary CSSNamespaceRules) are kept internally. All these classes accept for parameter ``selectorText`` (or ``cssText`` for CSSStyleRule) a tuple of ``(string-to-parse, dict-of-namespaces)`` now while not attached to a style sheet. If attached ``dict-of-namespaces`` is ignored as the namespaces of the relevant style sheet are used. If you need to set e.g. a new selector within a yet undefined namespace, set the namespace in the style sheet first simply by setting e.g. ``sheet[prefix] = namespaceURI``
        - removed ``CSSStyleSheet.prefixes``
        - removed ``Selector.prefixes``

    - **API CHANGE**: ``parentRule`` and ``parentStyleSheet`` of all CSS rules are now readonly to prevent building illegal style sheets.

    - **API CHANGE**: Changed order of constructor parameters for ``CSSStyleDeclaration``. Named parameters SHOULD be used anyway but be careful if you used ordered ones here!

    * **FEATURE**: ``CSSStyleSheet`` and ``CSSMediaRule`` are iterable now. Both iterate on their ``cssRules``. (Internally generators are used.)

    * **FEATURE**: added convinience method ``CSSStyleSheet.add(rule)``  which behaves exactly like ``.insertRule(rule, inOrder=True)``. So rules are added to the approprite position in a style sheet. E.g a namespace rule if put after any @import but before other rules like style or font-face rules.

    * **FEATURE**: added parameter ``inOrder=False`` to method ``CSSStyleSheet.insertRule`` which inserts a given rule to its proper hierarchy. Parameter ``index`` is ignored in this case but the resulting index is properly returned.

    * FEATURE: added convinience method ``CSSMediaRule.add(rule)`` which behaves exactly like ``.insertRule(rule)`` (there is no parameter "inOrder" here as no invalid order may be build in CSS 2.1 or 3).

    * FEATURE: Added ``Selector.parentList`` which contains a reference to the containing ``SelectorList``. Needed (at least) to process namespaces properly.

    + **BUGFIX**: ``CSSMediaRule.insertRule`` setting with a rule string fixed

    + **BUGFIX**: ``*.parentStyleSheet`` and ``*.parentRule`` where * is any CSSRule is properly set now

    + **BUGFIX**: ``CSSStyleDeclatation.getPropertyPriority(p)`` returns ``important`` (without the ``"!"``!) or the empty string now (see http://dev.w3.org/csswg/cssom/#the-cssstyledeclaration). Same goes for ``Property.priority`` which is not in CSSOM but cssutils only.

        (``Property._normalpriority`` has been removed, the normalized value that was available here is now in ``Property.priority``. The literal priority value is available in ``Property.literalproperty`` now (analog to ``Property.literalname``). All these values probably should not be used by client code anyway but may be helpful when using CSS hacks.)

    + BUGFIX: Changed serialization of combinators in ``Selector`` according to http://dev.w3.org/csswg/cssom/#selectors, e.g. ``a>b+c~d e`` serializes as ``a > b + c ~ d e`` now (single spaces around +, > and ~). A new serializer preference ``selectorCombinatorSpacer = u' '`` has been added to overwrite this behaviour (which is set to ``u''`` when using the CSS minifier settings)

    + BUGFIX: Some minor fixes including some reference improvements

    - IMPROVEMENT: csscombine is available via ``from cssutils.scripts import csscombine`` now (not directly in cssutils though!). Some optimizations and comments added.


0.9.5a2 080115
    + **BUGFIX**: Serializing a ``CSSStyleDeclaration`` did not include the effective properties but the last property if set multiple times in a single declaration and preferences ``keepAllProperties == False``.

    + BUGFIX: Fixed parsing of last remaining example in CSS spec ``color:red; color{;color:maroon}; color:green`` which now correctly parses ``color: green``

    + BUGFIX: ``CSSStyleDeclaration.__contains__(property)`` uses not the literal but the normalized name (``Property.name``) to check if a property is set in this declaration now

    + BUGFIX: ``CSSStyleDeclaration.getProperties(all=True)`` failed if comments were present

0.9.5a1 080113
    + **API CHANGE**: ``Property.name`` is now the same as ``Property.normalname`` which is DEPRECATED now. To access the literal name (the value which was available in ``name`` until now) use ``Property.literalname``. For most cases where a property name is used the new behaviour makes more sense, therefor the change.

        **Do not use ``normalname`` anymore, it will probably be removed for release 1.0.**

        NEW since 0.9.5::

            p = Property(ur'c\olor', 'red')
            p.name == ur'color'
            p.literalname == ur'c\olor'
            # DEPRECATED: p.normalname == ur'color'

        OLD until 0.9.5::

            p = Property(ur'c\olor', 'red')
            p.name == ur'c\olor'
            p.normalname == ur'color'

    + **API CHANGE**: iterating over ``css.CSSStyleDeclaration`` yields now *effective* properties only and not *all* properties set in the declaration. E.g. from ``color: red; c\olor: green`` only one Property is returned which has the value ``green``. To retrieve *all* properties use ``CSSStyleDeclaration.getProperties(all=True)``. Reason for this change is that for most cases the new default makes more sense.

    - **FEATURE**: ``css.CSSStyleDelcaration`` supports ``in`` now. Expected is a Property or a name of a property which is checked if already in the style declaration

    - **FEATURE**: ``css.Selector`` has a **readonly** property ``specificity`` now which is calculated as described at http://www.w3.org/TR/css3-selectors/#specificity

      **ATTENTION**: changing the Selector by changing its property ``seq`` does **not** update the specificity! ``Selector.seq.append`` has been made private therefor and writing to ``seq`` **not** be used at all!

    - **FEATURE**: Added ``css.CSSStyleDeclaration.getProperty(name, normalize=True)`` which returns the effective Property object for ``name``.

    - FEATURE: Implemented http://csswg.inkedblade.net/spec/css2.1#issue-23, URI may be ``URL(...)`` or ``u\r\6c(...)`` now

    + **BUGFIX**: ``CSSStyleDeclaration.removeProperty(name, normalize=True)`` removes all properties with given ``name`` now and returns the effective value. If ``normalize==False`` removes only properties with ``name=Property.literalname`` and also only returns the effective value of the unnormalized name.

    + **BUGFIX**: Priority of Properties is acknowledged by all methods of ``css.CSSStylesDeclaration`` now.

    + **BUGFIX**: Fixed serializing of strings like "\\a", "\\22" and '\\27' in @import urls, selectors and values. **func("string") is not yet fixed!!!**

    - CHANGE: ``CSSValueList`` does not emit warnings for shorthand properties anymore. Nevertheless these may be invalid!

    - IMPROVEMENT: ``CSSStyleDeclaration`` and some minor other parts refactored

0.9.4b1 071229
    - **FEATURE**: Added ``csscombine`` script which currently resolves @import rules into the input sheet. No nested @imports are resolved yet and @namespace rules do not work yet though!

    - FEATURE: ``css.CSSStyleSheet.insertRule(rule, index)`` accepts now a ``css.CSSRuleList`` in addition to a ``css.CSSRule`` object or a CSS string. Useful if you like a combine a complete sheet into an existing one.

    + **BUGFIX**: Serializing escape sequences add a single SPACE after each escape. This was not present until now so a sequence like "\\74 a" did come out as "\\000074a" which was not as intended. Also as a SPACE is inserted in any case all escapes are not padded to 6 digits anymore but are only as long as needed.

    + **BUGFIX**: Handling of illegal selectors is now same as the W3C CSS validator (and according the selector spec - I hope ;). Illegal selectors result the complete rule being dropped. Fixed are the following (edge) cases:

      ``a/**/b``
        Meant was probably a space between a and b (plus maybe the comment) but it MUST be inserted. IE and Safari nevertheless seem to parse this rule as ``a b`` so as if a space would be present. cssutils now parses this selector as intented by the spec as ``ab``.
      ``a*b``
        Again spaces around the UNIVERSAL ``*`` were probably meant by the author. IE and Safari seem to parse this **invalid** selector as ``a b``. cssutils ignores this rule completely!

    + BUGFIX: ``css.CSSRuleList`` is still a Python list but setting methods like ``__init__``, ``append``,     ``extend`` or ``__setslice__`` are added later on instances of this class if so desired. E.g. CSSStyleSheet adds ``append`` which is not available in a simple instance of this class! This has been changed as no validation is possible in CSSRuleList itself.

    - CHANGE: Unknown media type in a MediaQuery (e.g. ``@media tv, radio``) does emit WARNING instead of ERROR now.

    + IMPROVEMENT: Added better ``str`` and ``repr`` to cssutils.serializer.Preferences

    + IMPROVEMENT: Added position information to some error reportings (Property, CSSMediaRule

0.9.4a4 071202
    - **FEATURE**: Implemented ``css.CSSFontFaceRule``.

    - **FEATURE**: Added ``css.CSSStyleSheet.encoding`` which reflects the encoding of an explicit @charset rule. Setting the property to ``None`` removes an @charset rule if present and sets the encoding to the default value 'utf-8'. Setting a value of ``utf-8`` sets the encoding to the default value too but the @charset rule is explicitly added.

      Effectively this removes the need to use ``css.CSSCharsetRule`` directly as using this new property is easier and simpler.

      (A suggestion in the `CSSOM <http://dev.w3.org/csswg/cssom/#the-csscharsetrule>`_ but not yet resolved. IMHO it does make sense so it is present in cssutils. ``css.CSSCharsetRule`` remains though if you really *want* to use it).

    + **BUGFIX/IMPROVEMENT**: ``css.SelectorList`` and ``stylesheets.MediaList`` have (Python) list like behaviour partly but are *directly not lists anymore* (which did not work properly anyway...). The following list like possibilities are implemented for now:

      - ``item in x`` => bool
      - ``len(x)`` => integer
      - get, ``del`` and set ``x[i]``
      - ``for item in x``
      - ``x.append(item)``

      The DOM additional methods and properties like ``length`` or ``item()`` are still present (and also will be in the future) but the standard Python idioms are probably easier to use.

      ``stylesheets.StyleSheetList`` and ``css.CSSRuleList`` are the only direct lists for now. This may change in the future so it is safer to also use the above possibilities only for now.

    + BUGFIX: Fixed handling of "\\ " (an escaped space) in selectors and values.

    + BUGFIX: ``!important`` is normalized (lowercase) now

    - IMPROVEMENT: Some error messages have been changed slightly, mostly values are given with their Python representation and not the actual values.
    - IMPROVEMENT: The setup process of cssutils has been adapted to suggestions at http://jimmyg.org/2007/11/08/creating-a-python-package-using-eggs-and-subversion/

    + DOCS: Slight overhaul of docs.

0.9.4a3 071106
    + CSSCapture:
        + **FEATURE**: Added option ``-m, --minified`` to CSSCapture which saves the retrieved CSS files with the cssutils serializer setting ``Preferences.useMinified()``.

        - **BUGFIX**: option '-p' of csscapture is removed as it was not used anyway. A new option ``-r, --saveraw`` has been added which defaults to ``False``. If given saves raw css otherwise cssutils' parsed files.
        - **BUGFIX**: CSSCapture now uses the ``cssutils.parseString`` method so invalid sheets should be saved too. Until now in case of an error the sheet was not saved at all.

    - **BUGFIX/FEATURE**: Handling of unicode escapes should now work propertly.

      The tokenizer resolves any unicodes escape sequences now so cssutils internally simple unicode strings are used.

      The serializer should serialize a CSSStyleSheet properly escaped according to the relevant encoding defined in an @charset rule or defaulting to UTF-8. Characters not allowed in the current encoding are escaped the CSS way with a backslash followed by a uppercase 6 digit hex code point (**always 6 digits** to make it easier not to have to check if no hexdigit char is following).

      This *FEATURE* was not present in any older version of cssutils.

    - **BUGFIX**: Names (of properties or values) which are normalized should be properly normalized now so simple escapes like ``c\olor`` but also unicode escapes like ``\43olor`` should result in the property name ``color`` now

    - **BUGFIX**: Selector did fail to parse negation ``:not(`` correctly
    - **BUGFIX**: CSSValueList treated a value like ``-1px`` as 2 entries, now they are correctly 1.
    - **BUGFIX**: Validation of values for ``background-position`` was wrong.
    - **BUGFIX**: ``CSSPrimitiveValue.primitiveValue`` was not recognized properly if e.g. a CSS_PX was given as '1PX' instead of '1px'.
    - **BUGFIX/CHANGE**: Reporting of line numbers should have improved as ``\n`` is now used instead of ``os.linesep``.

    + **CHANGE**: Invalid Properties like ``$top`` which some UAs like Internet Explorer still are use are preserved. This makes the containing Property and CSSStyleDeclaration invalid (but still *wellformed* although they technically are not) so if the serializer is set to only output valid stuff they get stripped anyway.

      **This may change and also simply may be put in a cssutils wide "compatibility mode" feature.**

    + **CHANGE**: If a CSSValue cannot be validated (no property context is set) the message describing this is set to DEBUG level now (was INFO).

    + IMPROVEMENT: "setup.py" catches exception if setuptools is not installed and emits message

    - DOCS: Added more documentation and also a standalone HTML documentation which is generated from the SVN RST docs.

0.9.4a2 071027
    - **FEATURE**: added ``Preferences.useMinified()`` which sets preferences that a stylesheet will be serialized as compact as possible. Added ``Preferences.useDefaults()`` which resets the serializer preferences. There a few new preferences have been added as well (see the documentation for details as most are hardly useful for normal usage of the library)

    + **BUGFIX**: Fixed parsing of ``font`` value which uses "font-size/line-height" syntax.

    - CHANGE: ``Preferences.keepAllProperties`` defaults to ``True`` now (hardly used but safer if different values have been set which are used by different UAs for example.)

0.9.4a1 071021 (new parser [again])
    - **FEATURE**: Added a new module ``cssutils.codec`` that registers a codec that can be used for encoding and decoding CSS. (http://www.w3.org/TR/2006/WD-CSS21-20060411/syndata.html#q23)

    - **FEATURE**: Added implementation of ``stylesheets.MediaQuery`` which are part of  stylesheets.MediaList. See the complete spec at http://www.w3.org/TR/css3-mediaqueries/ for details.

      Not complete yet: Properties of MediaQueries are not validated for now and maybe some details are missing

    - FEATURE: Implemented ``cssutils.DOMImplementationCSS``. This way it is possible to create a new StyleSheet by calling ``DOMImplementationCSS.createCSSStyleSheet(title, media)``. For most cases it is probably easier to make a new StyleSheet by getting an instance of ``cssutils.css.CSSStyleSheet`` though.

    - FEATURE: cssutils is registered to ``xml.dom.DOMImplementation`` claiming to implement CSS 1.0, CSS 2.0, StyleSheets 1.0 and StyleSheets 2.0. This is probably not absolutely correct as cssutils currently is not a fully compliant implementation but I guess this is used very rarely anyway.

    + **API CHANGE**: ``CSSNamespacerule.uri`` is renamed to ``CSSNamespaceRule.namespaceURI`` which is defined is CSSOM. ``uri`` is deprecated and still available but the constructor parameter is named ``namespaceURI`` in any case now.

    + **API CHANGE**: As ``stylesheets.MediaQuery`` is implemented now all classes using an instance of ``stylesheets.MediaList`` are presented slightly different. Until now a simple list of string was given, now the list contains MediaQuery objects.

    + **API CHANGE**: ``_Property`` has been renamed to ``css.Property`` and is used in context of ``CSSStyleDeclaration`` and ``MediaQuery``. Attribute ``Property.value`` has been *de-deprecated* and may be used normally now (again). The Property constructor has only optional parameters now.

    + **API CHANGE**: Removed experimental class ``SameNamePropertyList`` which was used in ``CSSStyleDeclaration`` and also method ``CSSStyleDeclaration.getSameNamePropertyList``. A new method ``CSSStyleDeclaration.getProperties()`` has been added which is simpler and more useful

    + **API CHANGE**: renamed attribute ``namespaces`` of CSSStyleSheet and Selector to ``prefixes`` as they really are the prefixes of declared namespaces

    - API CHANGE (internal): renamed ``Serializer.do_css_Property`` to ``Serializer.do_Property`` as it is ``Property`` is not in the official DOM, may not stay in package ``css`` and is used by MediaQuery too

    - API CHANGE (internal): renamed ``Serializer.do_CSSvalue`` to ``Serializer.do_CSSValue``

    + BUGFIX: Tantek hack (using ``voice-family``) should work now as SameNamePropertyList is removed and properties are kept in order

    + BUGFIX: Token CHARSET_SYM is now as defined in the CSS 2.1 Errata as literal "@charset " including the ending space.

    - **CHANGE**: A completely new tokenizer and mostly also the parser have been reimplemented in this release. Generally it should be much more robust and more compliant now. It will have new errors and also some slight details in parsing are changed.

    + **DOCS**: Added some docs in reStructuredText format including a basic server to view it as HTML. The HTML may be published as well.

0.9.3a1 - 070905
    - FEATURE: Implemented css.CSSValue, css.CSSPrimitiveValue and css.CSSValueList.

        Not yet implemented are:
            - css.CSSPrimitiveValue.getCounterValue and css. Counter
            - css.CSSPrimitiveValue.getRGBColorValue and css.RGBColor
            - css.CSSPrimitiveValue.getRectValue and css.Rect

        + FEATURE: css.CSSValueList is iterable so may be used in a for loop
        + FEATURE: CSSValue has property ``cssValueTypeString`` which is the name of the relevant ``cssValueType``, e.g. "CSS_PRIMITIVE_TYPE". Mainly useful for debugging.
        + FEATURE: CSSPrimitiveValue has property ``primitiveTypeString`` which is the name of the relevant ``primitiveType``, e.g. "CSS_PX". Mainly useful for debugging.
        + CSSValue has an init Parameter ``_propertyname`` to set a context property for validation. If none is set the value is always invalid. **THIS MAY CHANGE!**

    - FEATURE (**experimental**): CSSStyleDeclaration is iterable now. The iterator returns *all* properties set in this style as objects with properties ``name``, ``cssValue`` and ``priority``. Calling CSSStyleDeclaration.item(index) on the other hand simply returns a property name and also only the normalized name (once). Example::

            sheet = cssutils.parseString('a { color: red; c\olor: blue; left: 0 !important }')
            for rule in sheet.cssRules:
                style = rule.style
                for property in style:
                    name = property.name
                    cssValue = property.cssValue
                    priority = property.priority
                    print name, '=', cssValue.cssText, priority

                # prints:
                # color = red
                # c\olor = blue
                # left = 0 !important

                for i in range(0, style.length):
                    name = style.item(i)
                    cssValue = style.getPropertyCSSValue(name)
                    priority = style.getPropertyPriority(name)
                    print name, '=', cssValue.cssText , priority

                # prints:
                # color = blue
                # left = 0 !important

      **ATTENTION**: This has been changed in 0.9.5, see details there!

    - FEATURE (**experimental**): added ``CSSStyleSheet.replaceUrls(replacer)`` which may be used to adjust all "url()" values in a style sheet (currently in CSSStyleDeclaration and CSSImportRules).

    - FEATURE: added ``CSSStyleDeclaration.getCssText(separator=None)`` which returns serialized property cssText, each property separated by given ``separator`` which may e.g. be u'' to be able to use cssText directly in an HTML style attribute. ";" is always part of each property (except the last one) and can **not** be set with separator!

    - FEATURE: ``href`` and ``media`` arguments can now be passed to ``parse()`` and ``parseString()`` functions and methods. This sets the appropriate attributes on the generated stylesheet objects.

    - FEATURE: CSSMediaRule has an init parameter ``mediaText`` synchronous to CSSImportRule now

    - FEATURE: The ``MediaList`` constructor can now be passed a list of media types.

    - FEATURE: ``CSSRule`` and subclasses have a property ``typeString`` which is the name of the relevant ``type``, e.g. ``STYLE_RULE``. Mainly useful for debugging.

    - FEATURE: ``cssutils.serialize.Preferences`` has a new option ``lineSeparator`` that is used as linefeed character(s). May also be set to ``u''`` for ``CSSStyleDeclareation.cssText'`` to be directly usable in e.g. HTML style attributes

    + API CHANGE (internal): renamed serializers method ``do_stylesheet`` to ``do_CSSStyleSheet``

    - BUGFIX (Bitbucket #9): Parsing of empty ``url()`` values has been fixed
    - BUGFIX: Handling of linenumbers in the serializer has been fixed.
    - BUGFIX (minor): removed debug output in CSSStyleDeclaration

    + CHANGE (experimental!): CSSStyleDeclaration.getPropertyCSSValue() for shorthand properties like e.g. ``background`` should return None. cssutils returns a CSSValueList in these cases now. Use with care as this may change later

    + CHANGE: CSSValue default cssText is now ``u""`` and not ``u"inherit"`` anymore

    + CHANGE: ``css.CSSStyleDeclaration.cssText`` indents its property not anymore.

    + CHANGE: ``cssutils.serialize.CSSSerializer`` has been refactored internally to support the lineSeparator option.

    + CHANGE: The Selector and SameNamePropertyList (which might be renamed as it is experimental) class are now available from cssutils.css too.

       **UPDATE: SameNamePropertyList removed in 0.9.4**

    + CHANGE: Tokenizer strips HTML comment tokens CDO and CDC from tokenlist now.

    + CHANGE: Added __repr__ and __str__ methods to most classes. __str__ reports e.g. ``<cssutils.css.CSSImportRule object href=None at 0xaaa870>``, __repr__  e.g. ``cssutils.css.CSSImportRule(href=None, mediaText=u'all')`` which is a valid contructor  for the object in most cases (which might not be complete for all init parameter for all classes like in this case though). The following details are included:

      css
        - CSSStyleSheet shows the title and href
        - CSSCharsetRule shows the encoding
        - CSSCharsetRule shows the cssText (not in __str__ though)
        - CSSImportRule shows the href and the MediaList mediaText
        - CSSMediaRule shows the MediaList mediaText
        - CSSNameSpaceRule shows the prefix and uri
        - CSSPageRule shows the selectorText
        - CSSStyleRule shows the selectorText
        - CSSUnknownRule shows nothing special
        - CSSStyleDeclaration shows the number of properties set for __str__ but an empty CSSStyleDeclaration constructor for __repr__ as showing cssText might be way too much
        - SameNamePropertyList shows the name
        - CSSValue, CSSPrimitiveValue show the actual value for __repr__, some details for __str__
        - CSSValueList shows an __repr__ which is **not** possible to ``eval()`` and some details for __str__
        - _Property shows infos but should be used directly for now anyway!
        - Selector the selectorText

      stylesheets
        - MediaList shows the mediaText

0.9.2b3 070804
    - FEATURE: Script ``cssparse`` handles more than one file at a time now (patch from Issue Bitbucket #6 by Walter Doerwald)

    - BUGFIX: Fixed Issue Bitbucket #7: typo gave AssertionError for selectors like ``tr:nth-child(odd) td{}``
    - BUGFIX: Fixed Issue Bitbucket #5: false warning for certain values for ``background-position`` removed
    - BUGFIX: Report of line/col for any node was not correct if a node contained line breaks itself

    - Quite a few internal optimizations (thanks to Walter Doerwald)
    - Added tests for issues Bitbucket #3 and Bitbucket #4 to tokenizer too

0.9.2b2 070728
    - BUGFIX: Fixed Issue Bitbucket #4, tokenizing of color values like ``Bitbucket #00a`` was buggy (mixture of numbers and characters). Also warnings of invalid property values should be more reliable now (regexes in ``css.cssproperties`` changed).

0.9.2b1 070726
    - BUGFIX: Fixed Issue Bitbucket #3, WS was not handled properly if added to token list by tokenizer

0.9.2a5 070624
    - BUGFIX: Unexpected end of style sheet now handled according to spec for most cases, e.g. incomplete CSSStyleRule, CSSMediaRule, CSSImportRule, CSSNamespaceRule, CSSPageRule.

0.9.2a4 070620
    - BUGFIX (major): no changes to the library, but fixed setup of source dist
0.9.2a3 071018
    - no changes to the library, just optimized setuptools dist

0.9.2a2 070617
    - API CHANGE: removed cssutils.util.normalize function, use static (but private!) method cssutils.util.Base._normalize if absolutely needed which may be change too though
    - API CHANGE (minor): removed ``getFormatted`` and ```pprint`` from various classes which were both DEPRECATED for some time anyway
    - API CHANGE (minor): _Property.value is DEPRECATED, use _Property.cssValue.cssText instead, _Property is defined as private anyway so should not be used directly
    - API CHANGE (minor): removed ``Tokenizer.tokensupto`` which was used internally only

    - CHANGE: Numbers and Dimensions starting with "." like ".1em" in the original stylesheet will be output as "0.1em" with a proceding 0 now.
    - CHANGE: Report of parsing errors have a slightly different syntax now.

    - FEATURE: New ``Preferences.omitLastSemicolon`` option. If ``True`` omits ; after last property of CSSStyleDeclaration

    - BUGFIX: The css validator definition for "num" was wrong, so values like ``-5.5em`` would issue a warning but should be correct
    - BUGFIX: Dimension were not parsed correcly so 1em5 was parsed a "1em" + 5 which should really be one "1em5" were "em5" is an unknown dimension. This had probably no effect on current stylesheets but was a tokenizing error
    - BUGFIX: Parsing of nested blocks like {}, [] or () is improved
    - BUGFIX: Comment were not parsed correctly, now ``/*\*/`` is a valid comment
    - BUGFIX: ``css.Selector`` had a warning which called "warning" which in fact is named "warn". Some other error messages gave token list instead of a more useful string in case of an error, that is fixed as well (CSSComment and CSSValue).

    - IMPROVEMENT: Line number are still not given for all errors reported but for at least some more now
    - IMPROVEMENT: Performance of the tokenizer has been improved, it is now about 20% faster (testing the unittests) which may not hold for all usages but is not too bad as well ;)

0.9.2a1 070610
    - FEATURE: Partly Implemented css.CSS2Properties so you can now use::

        >>> sheet = cssutils.parseString('a { font-style: italic; }')
        >>> style = sheet.cssRules[0].style
        >>> style.fontStyle = 'normal'
        >>> print style.fontStyle
        normal

      Each property can be retrieved from CSSStyleDeclaration object with its name as
      an object property. Names with "-" in it like ``font-style`` need to be called by
      the respective DOM name ``fontStyle``.
      Setting a property value works the same way and even ``del`` which effectively removes a property from a CSSStyleDeclaration works. For details see CSSStyleDeclaration.

      Not implemented are the finer details, see the module documentation of
      cssutils.css.cssproperties.

    - BUGFIX: CSSStyleDeclaration.getPropertyCSSValue returns None for all shorthand properties

    - refactored some parts and added more tests


0.9.1b3 070114
    - **CHANGE** for Serializer preference options:

        new name
        + ``defaultAtKeyword`` instead of ``normalkeyword``
        + ``defaultPropertyName`` instead of ``normalpropertyname``

        camelcase now:
        + ``keepComments`` instead of ``keepComments``
        + ``lineNumbers`` instead of ``linenumbers``

        replaced (see below)
        + ``keepAllProperties`` instead of ``keepsimilarnamedproperties``

    - FEATURE: ``Serializer.prefs.keepAllProperties`` replaces `` ``keepsimilarnamedproperties``:
        if ``True`` all properties given in the parsed CSS are kept.
        This may be useful for cases like::

            background: url(1.gif) fixed;
            background: url(2.gif) scroll;

        Certain UAs may not know fixed and will therefor ignore property 1 but
        an application might simply like to prettyprint the stylesheet without
        loosing any information.

        Defaults to ``False``.

        See examples/serialize.py for an usage example.

    - FEATURE(experimental, might change!):
        ``CSSStyleDeclaration.getSameNamePropertyList(name)``
        Experimental method to retrieve a SameNamePropertyList object which
        holds all Properties with the given ``name``. The object has an
        attribute ``name`` and a list of Property objects each with an actual name,
        value and priority.

        **UPDATE: SameNamePropertyList removed in 0.9.4**

        ``CSSStyleDeclaration.setProperty`` has a new positional parameter
        ``overwrite`` which defines if the property which is set overwrites any former
        value (or values, see ``getSameNamePropertyList``) (default behaviour) or the
        given value is appended to any former value (overwrite=False).
        Useful for cases where a property should have different values for different UAs.

        Example 1: CSS hacks::

            width: 100px; /* wrong box model value for IE5-5.5 */
            padding: 5px;
            w\idth: 90px; /* correct box model value for later browsers */

        Example 2: UA capabilities::

            background: url(2.gif) scroll; /* Fallback for UA which do not understand fixed */
            background: url(1.gif) fixed; /* UA which do know fixed */

    - FEATURE: Reimplemented csscapture, which uses the new serializer preference ``keepAllProperties``

    - BUGFIX(major!): Serializer outputs actual property depending on Property priority out now
        see ``examples/serialize.py``

    - BUGFIX(minor): Parameter ``name`` for `CSSStyleDeclaration.XXX(name)``
      is normalized now, so ``color``, ``c\olor`` and ``COLOR`` are all equivalent


0.9.1b2 070111
    - FEATURE: added ``Serializer.prefs.keepsimilarnamedproperties``:
        if ``True`` all properties with the same normalname but different
        actual names are kept, e.g. color, c\olor, co\lor.
        This is mainly useful to keep a stylesheet complete which uses
        xbrowser hacks as above.

        **UPDATE IN 0.9.1b3!**

    - BUGFIX (minor): ``Serializer.prefs.normalpropertyname`` did not work properly if a property was set 2 times in the same declaration, e.g. ``color: red;c\olor: green`` setting the pref to ``False`` results in ``c\olor: green`` now.
    - BUGFIX (minor): Serializing of CSSStyleDeclaration did not work well when CSSComments were mixed with Properties.


0.9.1b1
    - FUTURE CHANGE: ``readonly`` will be removed from most rules. It is not used anyway, may be readded in a future release

    - CHANGE: order of constructor parameters changed in ``CSSImportRule``. Should be no problem as positional parameters are discouraged anyway
    - CHANGE: cssutils needs Python 2.4 from the release on as it uses the buildin ``set``
    - CHANGE: removed ``CSSMediaRule.addRule`` which was deprecated anyway

    - FEATURE: implemented @page CSSRule including testcases
    - FEATURE: implemented @namespace CSSRule according to http://www.w3.org/TR/2006/WD-css3-namespace-20060828/ with the following changes
        * the url() syntax is not implemented as it may (?) be deprecated anyway
        * added namespace parsing to ``Selector``, see http://www.w3.org/TR/css3-selectors/
        * CSSStyleSheet checks if all namespaces in CSSStyleRules have been declared with CSSNamespaceRules. If not the rule's ``valid`` property is set to ``False`` and the serializer omits it (you may change ``Preferences.removeInvalid`` to change this behaviour).
        * CSSStyleSheet and Selector object have a new propery ``namespaces`` which currently contain declared and used namespace prefixes (!), this may change in the future so use with care if at all.
    - FEATURE: implemented ``CSSRule.parentStyleSheet`` for all rules
    - FEATURE: implemented ``CSSRule.parentRule`` for relevant rules (all allowed in @media)

    - BUGFIX: Set ``parentStyleSheet`` and ``parentRule`` as instance vars in ``css.CSSRule`` instead as class vars
    - BUGFIX: CSSComment raised exception if setting cssText with empty string - fixed

    - DOCS: generated docs with epydoc which are then included in src dist. Source documentation is cleaned up a bit.

    - INTERNAL: Refactored some unittests
    - INTERNAL: implementation based on `DOM Level 2 Style Recommendation <http://www.w3.org/TR/2000/REC-DOM-Level-2-Style-20001113/>`_ as opposed to the `Proposed Recommendation <http://www.w3.org/TR/2000/PR-DOM-Level-2-Style-20000927/>`_ now. As there are no main changes I could find this does not make any difference...


0.9.1a1
    - CHANGE, renamed ``Serializer.prefs.srcatkeyword`` to ``Serializer.prefs.normalkeyword``
      which work just the other way round but work as ``Serializer.prefs.normalpropertyname``

    - BUGFIX in css.Selector and added support regarding handling of pseudoclasses (``:x`` or ``:x()``) and pseudoelements ``::x``

    - BUGFIX and refactoring in tokenizer, mostly regarding escape sequences
        * combination of \ and NEWLINE in a string is removed according to spec now

    - added ``Serializer.prefs.normalpropertyname``, if True, property names are normalized if known (``color``), else literal form from CSS src is used (e.g. ``c\olor``). Defaults to ``True``.
    - removed ``Token.literal`` which value is in ``value`` now, normalized value is in ``normalvalue``
    - removed ``Token.ESCAPE``. Escapes are contained in IDENTifiers now.
    - internal change: WS is generally kept by tokenizer now, former normalized value ``u' '`` is hold in ``Token.normalvalue``. Serializer does not use it yet and some classes (like Selector) use normalvalue.

      uses normalized form of @keyword in source CSS if ``True`` (e.g. ``@import``), else literal form in CSS sourcefile (e.g. ``@i\mport``). Defaults to ``True``.



0.9a6
    - NEW ``Serializer.prefs.keepcomments`` removes all comments if ``False``, defaults to ``True``

    - NEW ``Serializer.prefs.srcatkeyword`` UPDATE see 9.91a1

    - fixed tokenizer to handle at least simple escapes like ``c\olor`` which is the same as ``color``. The original value is preserved but not used yet except in CSSComments which preserve the original values. See also Serializer.prefs.srcatkeywords

    - ``CSSMediaRule`` tested and lots of bugfixes
        * constructor has **no** parameters anymore (``mediaText`` is removed!)
        * ``addRule`` is DEPRECATED, use ``insertRule(rule)`` with no index instead.
          Synchronized with ``CSSStyleSheet.insertRule``

    - setting of ``CSSImportRule.media`` removed, use methods of this object directly.
      Synchronized with ``CSSMediaRule.media``

    - ``CSSStyleSheet.insertRule`` raises ``xml.dom.IndexSizeErr`` if an invalid index is given. Index may be ``None`` in which case the rule will be appended.
        Synchronized with ``CSSMediaRule.insertRule``

    - CSSStyleDeclaration bugfixes in parsing invalid tokens
    - stylesheets.MediaList bugfixes in parsing uppercase media values like ``PRINT``
    - added more unittests (CSSMediaRule)
    - various bugfixes


0.9a5 061015
    - reimplemented property validator:
        - for unknown CSS2 Properties a INFO message is logged
        - for invalid CSS2 Property values a WARNING message is issued

    - atrules have a new property ``atkeyword`` which is the keyword used in the CSS provided. Normally something like "@import" but may also be an escaped version like "@im\port" or a custom one used in CSSUnknownRule.

    - tokenizer and css.selector.Selector
        - added CSS3 combinator ``~``
        - added CSS3 attribute selectors ``^=``, ``$=``, ``*=``
        - added CSS3 pseudo selector ``::`` and pseudo-functions like ``:lang(fr)``

    - Token
        - added some new constants mainly replacing DELIM, e.g. UNIVERSAL, GREATER, PLUS, TILDE

        (CSS3 see http://www.w3.org/TR/css3-selectors)

    - Improved parsing of "Unexpected end of string" according to spec
    - fixed serializing of CSSUnknownRule if ``valid == False``

    - Properties may also be set with a numeric value now, before everything had to be a string. Direct use of _Property is discouraged though as it may well be changed again in a future version.

0.9a4 060927
    - CSSStyleSheet:
        - removed init parameter ``type`` which is now set as a static type to "text/css"
        - removed ``addRule`` which emits DeprecationWarning now
          Use ``insertRule`` without parameter ``index``
        - added new methods ``setSerializer(cssserializer)`` and
          ``setSerializerPref(self, pref, value)`` to control output
          of a stylesheet directly.

    - CSSStyleRule:
        - new property ``selectorList`` is an instance of SelectorList
          which contains a list of all Selector elements of the rule
        - removed ``addSelector()`` and ``getSelectors()``,
          use property ``selectorList`` instead
        - removed ``getStyleDeclaration()`` and ``setStyleDeclaration()``,
          use property ``style`` instead

    - CSSStyleDeclaration:
        - new constructor parameter ``cssText``

    - moved ``SelectorList``, ``Selector`` and ``Property`` to own modules.
      Should not be used directly yet anyway.

    - Token: renamed ``IMPORTANT`` to ``IMPORTANT_SYM``

    - unittests:
        - added tests for CSSStyleSheet, CSSStyleRule, SelectorList, Selector
          CSSStyleDeclaration, _Property

0.9a3 - 060909
    - refined EasyInstall (still some issues to be done)
    - CSSCharsetRule serialized and parsed according to spec only as ``@charset "ENCODING";`` so no comments allowed, only one space before encoding string which MUST use ``"`` as delimiter (see http://www.w3.org/TR/CSS21/syndata.html#q23)
        NOT COMPLETE YET, E.G. BOM HANDLING

    - added tests for setting empty cssText for all @rules and CSSStyleRule
    - bugfixes
        - CSSStyleDeclaration: Of two Properties if written directly after another``a:1;b:2`` one was swallowed
    - CSSSerializer:
        added new class cssutils.serialize.Preferences to control output or CSSSerializer

0.9a2 - 060908
    - using setuptools for deployment
        - new script ``cssparse`` which pprints css "filename"

    - subpackages ``css`` and ``stylesheets`` are directly available from ``cssutils`` now
    - renamed module ``cssutils.cssparser`` to ``cssutils.parse`` which should not be used directly anyway. Always use ``cssutils.CSSParser`` or ``cssutils.parse`` (s.b)
    - added utility functions ``parse(cssText)`` and ``parse(filename, encoding='utf-8')`` to cssutils main package which work like the CSSParser functions with the same name and API
    - return value of ``.cssText`` is ``u''`` and not ``None`` if empty now

    - serializing
        - cssutils.Serializer renamed to cssutils.CSSSerializer to improve usage of
           ``from cssutils import *``
        - cssutils has a property "ser" which is used by all classes to serialize themselves
          it is definable with a custom instance of cssutils.Serializer by setting
          cssutils.setCSSSerializer(newserializer)

        - prefs['CSSImportrule.href format'] may be set to
            - 'uri': renders url(...) (default)
            - 'string': renders "..."
            - None: renders as set in CSSImportRule.hreftype

    - css.CSSCharsetRule:
        - improved parsing
        - fixed API handling (setting of encoding did not work)

    - css.CSSImportRule:
        - improved parsing

    - usage of \*.getFormatted emits DeprecationWarning now and returns \*.cssText

    - lots of bugfixes and refactoring of modules, classes
    - extension and refactoring of unittests

0.9a1 - 060905 with a new parser (again)
    - new tokenizer, complete rewrite
        * parses strings and comments
        * parses unicode escape sequences (see following)
        * emits CSS tokens according to spec (update: not all yet (ESCAPE)!)

    - renamed module "comment" to "csscomment" and class "Comment" to "CSSComment"
    - configurable Serializer instead of pprint
    - reimplemented CSSMediaRule


0.8.x
-----

0.8a6 - 050827
    - bugfixes in valuevalidator regarding values of "background-position", thanks to Tim Gerla!

0.8a5 - 050824
    - bugfix in css.Comment: if constructor was called with empty or no cssText an exception was raised, reported by Tim Gerla!
    - prepared inline comments run through epydoc and generated API docs

0.8a4 - 050814
    - csscapture.py
        * does download linked, inline and @imported stylesheets now
        * renamed csscapture.Capture to csscapture.CSSCapture
        * added options, use ``csspapture.py -h`` to view all options
    - cssutils.css.CSSStyleSheet defines ``literalCssText`` property if property
      ``cssText`` is set. This is the unparsed cssText and might be different to cssText
      e.g. in case of parser errors.

0.8a3 - 050813
    - custom log for CSSparser should work again
    - calling script cssparser has 2 new options (not using optparse yet...)
        cssparser.py filename.css [encoding[, "debug"]]
        1. encoding of the filename.css to parse
        2. if called with "debug" debugging mode is enabled and default log prints all messages

    - cssutils.css.CSSUnknownRule reintegrated and Tests added
    - cssutils.Comment reintegrated
        implements css.CSSRule, there a new typevalue COMMENT (=-1) is added
    - lexer does handle strings *almost* right now...
    - bugfixes
    - simplified lexer, still lots of simplification todo

0.8a2 - 050731
    - CSSParser may now directly be used from cssutils
      cssutils.cssparser as a standalone script does work too.
    - css.CSSStyleDeclaration.getPropertyCSSValue(name) implemented
    - css.CSSValue updated
    - xml.dom.InvalidModificationErr now raised by CSSRule subclasses instead of xml.dom.SyntaxErr in case a non expected rule has been tried to set
    - test are updated to the new API and work (not complete and exhaustive though but a bit more than for 0.61)
    - bugfixes in some classes due to reanimated tests
    - moved module valuevalidator from cssutils.css to cssutils.
      Should not be used directly anyway
    - split CSSParser in actual CSSParser and utility module used by CSSParser and each css class cssText setting method
    - loghandler.ErrorHandler does raiseExceptions by default now. Only CSSParser does overwrite this behaviour. Some tests still need to be looked into...

0.8a1 - 050730
    bugfix medialist
        medium "projection" was spelled wrong (ended with a space)

    docs
        new examples and new structure on the website

    NEW API **INCOMPATIBLE API CHANGES**
        * new package cssutils.css which contains CSS interface implementations (css.CSSStyleSheet, css.CSSRuleList etc)
        * new package cssutils.stylesheets which contains Stylesheets interface implementations are in (stylesheets.StyleSheet, stylesheets.MediaList etc)
        * module cssutils.cssbuilder has therefor been removed and is replaced by packages cssutils.css and cssutils.stylesheets.
          (You may like to define your own cssbuilder module which imports all new classes with their old name if you do not want to change all your code at this time. Usage of the new names is recommended however and there are more subtle changes.)
        * CSS interfaces use W3 DOM names normally starting with CSS... now (e.g. CSSStyleSheet)
        * CSSStyleSheet now uses superclass stylesheets.StyleSheet
        * CSSImportRule is changed to comply to its specification (MediaList is after the URI and not before)
        * CSSFontfaceRule (cssutils FontfaceRule) is removed as CSS 2.1 removed this @ rule completely
        * CSSProperties is removed. Properties are useful in CSSStyleDeclaration only anyway and are used through that class now.
        * some parameters have been renamed to their respective DOM names (e.g. selector is selectorText now in CSSStyleRule constructor
        * the API has been cleaned up a bit. Some redundant methods have been removed.
            - cssmediarule: removed  getRules(), use cssRules property instead

        * Comment as a rule is removed currently, might be reintegrated in a future version.
        * some classes which have not been implemented fully anyway are not available until they are finished. This is mainly CSSMediaRule (will follow shortly), CSSUnknownRule, CSSValue and other value classes.


0.6.x
-----

0.61 - 050604
    bugfix reported and fixed thanks to Matt Harrison:
        'border-left-width' property was missing from cssvalues.py

0.60b
    tiny internal changes

0.60a
    added modules to validate Properties and Values
    thanks to Kevin D. Smith

    MediaList renamed media type "speech" to "aural"

0.5.x
-----

0.55_52 - 040517 bugfix bugfix release
    should do test first ;)
    added unittest and fix for fix

0.55_51 - 040517 bugfix release
    cssstylesheet.StyleSheet _pprint was renamed to _getCssText but
    the call in pprint was not changed...

0.55_5 - 040509
    API CHANGES

    StyleDeclaration
        addProperty made/named private
        DEPRECATED anyway, use setProperty

        parentRule raises NotImplementedError

    RGBColor Implemented
    PrimitiveValue uses RGBColor

    CSSParser uses setProperty instead of addProperty now
    StyleDeclaration, Value, ValueList, PrimitiveValue, RGBcolor
    done comparing spec and module docstrings

    made list of TODOs

0.55_4 - 040502
    implement \*Rule.cssText setting (UnknownRule not complete)

    lexer has no log anymore, simply "logs" everything to the
    resulting tokenlist

    cssstylesheet simplified

    bugfixes

0.55_3 not released
    cssnormalizer renamed, does not work anyway at the moment

    implemented StyleRule.cssText setting

    cssproperties.Property has new init param raiseExceptions
    similar to the one of CSSParser. does not log yet
    and functionality might change as well
    * what will not change is that you can specify not
    officially specified properties (like moz-opacity etc)

    some cleanup in various classes

0.55_2 not released
    tests only

0.55_1 not released
    API CHANGES
        CSSFontFaceRule and CSSPageRule
        style is readonly now

    NEW
        CSSRule
        implementation cssText setting
        improved docstrings

    CSSCharsetRule, CSSFontFaceRule, CSSFontFaceRule, CSSImportRule, CSSSMediaRule, CSSPageRule, CSSStyleRule, CSSUnknownRule
        use CSSRule implementation
    CSSCharsetRule
        uses codecs module to check if valid encoding given
    CSSImportRule
        new property styleSheet, always None for now

    simplified and cleaned up sources
    some bugfixes

    added tests
        test_cssrule
        test_csscharsetrule, test_cssfontfacerule, test_cssimportrule,

        test_mediarule, test_stylesheetrule, test_unknownrule
            subclass test_cssrule now
    improved unittests
        test_cssstylesheet import problem removed

0.55b not released
    start implementation StyleRule.cssText setting

0.54 not released
    API CHANGES
        Comment.cssText contains comment delimiter
        attribute text of Comment private now, renamed to _text
        ALPHA new StyleSheet.cssText property (not in W3C DOM)

    BUG FIXES
        Commentable checked only for str, not unicode. now both
        Parser did not raises all errors, might still not do (s. a.)

    added unittest for __init__ module

0.53 - 040418
    !cssnormalizer does not work in this version - on hold for 1.0

    new cssunknownrule.UnknownRule (moved out of module cssrule)
    parser now creates Unknown At-Rules in the resulting StyleSheet. they
    are no longer just dumped and reported in the parser log.

0.52 - 040414
    !cssnormalizer does not work in this version - on hold for 1.0

    whitespace in comments will be preserved now
        added unittest

0.51 - 040412
    !cssnormalizer does not work in this version - on hold for 1.0

    API CHANGES
    cssrule.SimpleAtRule DEPRECATED and empty
    cssmediarule.MediaRule init param "medias" renamed to "media"
    use subclasses of CSSRule (CharsetRule, ImportRule,
    FontFaceRule or PageRule) instead
    StyleRule constructor can be called with arguments (again...)
    Comment attribute "comment" renamed to "text"

    implemented at least partly almost all DOM Level 2 CSS interfaces now
    so the API should be more stable from now on

    new statemachine and lexer helper classes for parsing
    complete rewrite of CSSParser
    CSSParser and lexer put all error messages in a log now
    you might give your own log for messages
    CSSParser might be configured just to log errors or to raise
    xml.dom.DOMExceptions when finding an error


0.4.x
-----

0.41 - 040328
    !cssnormalizer does not work in this version - on hold for 1.0

    API CHANGES
    StyleSheet.getRules() returns a RuleList now
    class Selector removed, integrated into Rules now

    moved most Classes to own module
        StyleSheet, StyleRule, MediaRule, ...

0.40a - 040321
    !cssnormalizer does not work in this version

    API CHANGES:
    cssbuilder.RuleList subclasses list
    cssbuilder.Selector moved to cssrules
    attribute style of class StyleRule made private (_style)
    removed StyleRule.clearStyleDeclaration
    attribute selectorlist of class Selector renamed to _selectors and made private

    NEW:
    MediaList class

    moved tests to directory test

    made a dist package complete with setup.py


0.3.x
-----

0.31 - 040320
    !cssnormalizer does not work in this version

    API CHANGES:
    StyleDeclaration.addProperty is now DEPRECATED
    use StyleDeclaration.setProperty instead

    removed CSSParser.pprint(). use CSSParser.getStyleSheet().pprint() instead
        (a StyleSheet object had a pprint method anyway)

    replaced cssutils own exceptions with standard xml.dom.DOMException
        and subclasses
        !catch these exceptions instead of CSSException or CSSParserException

    moved internal lists (e.g. StyleSheet.nodes list) to private vars
        StyleSheet._nodes
        !please use methods instead of implementation details


    removed cssexception module
    removed csscomment module, classes now directly in cssutils

    more unittests, start with python cssutils/_test.py

    more docs

    integrated patches by Cory Dodt for SGML comments and Declaration additions
    added some w3c DOM methods


0.30b - 040216
    severe API changes
    renamed some classes to (almost) DOM names, the CSS prefix of DOM names is ommited though

    renamed are
        - Stylesheet TO StyleSheet
        - Rule TO StyleRule
        - AtMediaRule TO MediaRule
        - Declaration TO StyleDeclaration

    the according methods are renamed as well

    class hierarchy is changed as well, please see the example

    classes are organized in new modules


0.2.x
-----

0.24_1 - 040214
    legal stuff: added licensing information
    no files released

0.24 - 040111
    split classes in modules, has to be cleaned up again

0.24b - 040106
    cleaned up cssbuilder
        - Comment now may only contain text
            and no comment end delimiter.
            (before it had to be a complete css
            comment including delimiters)
        - AtMediaRule revised completely
            validates given media types
            new method: addMediaType(media_type)

    cssparser updated to new cssbuilder interface and logic
    started unittests (v0.0.0.1..., not included yet)


0.23 - 031228
    new CSSNormalizer.normalizeDeclarationOrder(stylesheet)

    cssbuilder: added methods needed by CSSNormalizer

    CSSParser.parse bugfix


0.22 - 031226
    CSSParser:
            added \n for a declaration ending in addition to ; and }
    cssbuilder:
        docstrings added for @import and @charset
        support build of a selector list in a rule


0.21 - 031226
    cleaned up docstrings and added version information

0.20 - 031224
    complete rewrite with combination of parser and builder classes

0.1.x
-----
    0.10 - 031221
    first version to try if i can bring it to work at all

    only a prettyprinter included, no builder
