using System.Text.RegularExpressions;
using CommandLine;

namespace rgx;

internal interface ICmd
{
    public enum IncludeMode
    {
        Skip = default,
        Prepend = 1,
        Append = 2
    }

    public const string MetaFile = "<file>";
    public const string MetaStreamable = "<string> or <file>";
    public const string MetaRegexOpts = "(see: .NET RegexOptions)";
    public const string MetaIncludeMode = "skip, prepend or append";

    [Value(0, Required = true, HelpText = "Pattern to use (in-shell PCRE syntax)", MetaName = MetaStreamable)]
    public string pattern { get; set; }

    [Option('f', "flags", Required = false, Separator = ',', HelpText = "Flags for the Pattern", MetaValue = MetaRegexOpts)]
    public IEnumerable<RegexOptions> flags { get; set; }

    [Option('i', "input", Required = false, Default = null, HelpText = "An input source, uses stdin if unspecified", MetaValue = MetaStreamable)]
    public string? input { get; set; }

    [Option('o', "output", Required = false, Default = null, HelpText = "An output target, uses stdout if unspecified", MetaValue = MetaStreamable)]
    public string? output { get; set; }

    [Option('A', "start", Required = false, Default = null, HelpText = "A pattern that needs to match before the actual task may begin", MetaValue = MetaStreamable)]
    public string? start { get; set; }

    [Option('Z', "stop", Required = false, Default = null, HelpText = "A pattern that, when matches, exits the program", MetaValue = MetaStreamable)]
    public string? stop { get; set; }

    [Option('M', "unmatched", Required = false, Default = IncludeMode.Skip, HelpText = "What to do with unmatched inputs during output (default: Skip)", MetaValue = MetaIncludeMode)]
    public IncludeMode unmatched { get; set; }

    [Option('T', "untreated", Required = false, Default = IncludeMode.Skip, HelpText = "What to do with untreated but matched inputs during output (default: Skip)", MetaValue = MetaIncludeMode)]
    public IncludeMode untreated { get; set; }
}

[Verb("match", true, new[] { "-M", "m" }, HelpText = "Match or Replace input using RegExp and write results to output")]
internal class MatchCmd : ICmd
{
    public string pattern { get; set; }
    public IEnumerable<RegexOptions> flags { get; set; }
    public string? input { get; set; }
    public string? output { get; set; }
    public string? start { get; set; }
    public string? stop { get; set; }
    public ICmd.IncludeMode unmatched { get; set; }
    public ICmd.IncludeMode untreated { get; set; }
}

[Verb("expand", false, new[] { "-E", "e" }, HelpText = "Expand input using RegExp and write results to output")]
internal class ExpandCmd : ICmd
{
    [Value(1, Required = true, MetaName = "expander", HelpText = "Expander input string; uses [$1, $2, ..] variables for groups", MetaValue = ICmd.MetaStreamable)]
    public string expander { get; set; }

    public string pattern { get; set; }
    public IEnumerable<RegexOptions> flags { get; set; }
    public string? input { get; set; }
    public string? output { get; set; }
    public string? start { get; set; }
    public string? stop { get; set; }
    public ICmd.IncludeMode unmatched { get; set; }
    public ICmd.IncludeMode untreated { get; set; }
}

[Verb("split", false, new[] { "-S", "s" }, HelpText = "Split input using RegExp and write results to output")]
internal class SplitCmd : ICmd
{
    public string pattern { get; set; }
    public IEnumerable<RegexOptions> flags { get; set; }
    public string? input { get; set; }
    public string? output { get; set; }
    public string? start { get; set; }
    public string? stop { get; set; }
    public ICmd.IncludeMode unmatched { get; set; }
    public ICmd.IncludeMode untreated { get; set; }
} // effectively grep using defaults

[Verb("cut", false, new[] { "-C", "c" }, HelpText = "Cut matches out and write results to output")]
internal class CutCmd : ICmd
{
    public string pattern { get; set; }
    public IEnumerable<RegexOptions> flags { get; set; }
    public string? input { get; set; }
    public string? output { get; set; }
    public string? start { get; set; }
    public string? stop { get; set; }
    public ICmd.IncludeMode unmatched { get; set; }
    public ICmd.IncludeMode untreated { get; set; }
}